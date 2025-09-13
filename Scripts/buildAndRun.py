import subprocess
import argparse
import sys
import os
import re
import json
import logging

def find_app_bundle_id(project_path, scheme):
    """
    Finds the app's bundle identifier from the project's Info.plist.
    This is an approximation and may not work for all projects.
    """
    print("-------------------------------------------------------------------")
    print("Executing find_app_bundle_id...")
    try:
        # Get the path to the Info.plist file from the build settings
        cmd = [
            'xcodebuild',
            '-project', project_path,
            '-scheme', scheme,
            '-showBuildSettings'
        ]
        print("Executing command xcodebuild...")
        print(cmd)
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        print("Result of command xcodebuild...")
        print(result)
        
        # Regex to find the Info.plist file path
        match = re.search(r'(^|\n)\s*INFOPLIST_FILE\s*=\s*(\S+)', result.stdout)
        if not match:
            print("Error: Could not find Info.plist path.", file=sys.stderr)
            return None
            
        plist_path = os.path.join(os.path.dirname(project_path), match.group(2).strip())
        print(f"Plist path :: '{plist_path}'")

        # Regex to find the bundle identifier
        bundle_id_match = re.search(r'(^|\n)\s*PRODUCT_BUNDLE_IDENTIFIER\s*=\s*(\S+)', result.stdout)
        if not bundle_id_match:
            print("Error: Could not find PRODUCT_BUNDLE_IDENTIFIER.", file=sys.stderr)
            return None

        bundle_id = os.path.join(os.path.dirname(project_path), bundle_id_match.group(2).strip())
        print(f"Bundle ID :: '{bundle_id}'")

        return bundle_id

    except subprocess.CalledProcessError as e:
        print(f"Error executing command: {e.cmd}", file=sys.stderr)
        print(f"Stdout: {e.stdout}", file=sys.stderr)
        print(f"Stderr: {e.stderr}", file=sys.stderr)
    
    return None

def build_and_launch(project_path, scheme, simulator_name):
    """
    Builds the specified Xcode project and launches it on a simulator.
    """
    print("-------------------------------------------------------------------")
    print("Executing build_and_launch...")
    print(f"1. Building scheme '{scheme}' for project at '{project_path}'...")
    
    # Use a workspace if .xcworkspace file exists, otherwise use .xcodeproj
    base_name, ext = os.path.splitext(project_path)
    workspace_path = f"{base_name}.xcworkspace"
    
    if os.path.exists(workspace_path):
        build_command = [
            'xcodebuild',
            '-workspace', workspace_path,
            '-scheme', scheme,
            '-destination', f'platform=iOS Simulator,name={simulator_name}',
            '-configuration', 'Debug',
            'build'
        ]
    else:
        build_command = [
            'xcodebuild',
            '-project', project_path,
            '-scheme', scheme,
            '-destination', f'platform=iOS Simulator,name={simulator_name}',
            '-configuration', 'Debug',
            'build'
        ]
        
    try:
        # Build the project
        subprocess.run(build_command, check=True)
        print("2. Build successful.")
    except subprocess.CalledProcessError as e:
        print(f"Error: Build failed with return code {e.returncode}", file=sys.stderr)
        print(f"Stdout:\n{e.stdout}", file=sys.stderr)
        print(f"Stderr:\n{e.stderr}", file=sys.stderr)
        return

    print("3. Finding app bundle identifier...")
    bundle_id = find_app_bundle_id(project_path, scheme)
    if not bundle_id:
        print("Error: Could not find the app's bundle ID. Aborting launch.", file=sys.stderr)
        return

    print(f"4. Launching app with bundle ID '{bundle_id}' on simulator '{simulator_name}'...")
    
    # Find the simulator's ID
    try:
        sim_id_cmd = ['xcrun', 'simctl', 'list', 'devices', 'available', '--json']
        sim_list = subprocess.run(sim_id_cmd, capture_output=True, text=True, check=True).stdout
        sim_data = json.loads(sim_list)
        
        sim_udid = None
        for device_type, devices in sim_data['devices'].items():
            for device in devices:
                if device['name'] == simulator_name and device['isAvailable']:
                    sim_udid = device['udid']
                    break
            if sim_udid:
                break

        if not sim_udid:
            print(f"Error: Simulator '{simulator_name}' not found or not available.", file=sys.stderr)
            return

        # Boot simulator
        boot_command = ['xcrun', 'simctl', 'boot', sim_udid]
        print("Boot command...")
        print(boot_command)
        subprocess.run(boot_command, check=True)

        # Launch the app on the simulator
        launch_command = ['xcrun', 'simctl', 'launch', sim_udid, bundle_id]
        print("Launch command...")
        print(launch_command)
        subprocess.run(launch_command, check=True)
        print("5. App launched successfully.")

    except subprocess.CalledProcessError as e:
        print(f"Error: Failed to launch app with return code {e.returncode}", file=sys.stderr)
        print(f"Stderr:\n{e.stderr}", file=sys.stderr)
    except Exception as e:
        print(f"An unexpected error occurred: {e}", file=sys.stderr)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Builds an Xcode project and launches it on a simulator.")
    parser.add_argument("project_path", help="Path to the .xcodeproj file.")
    parser.add_argument("scheme", help="The Xcode scheme to build.")
    parser.add_argument("--simulator-name", default="iPhone 16 Pro Max", help="Name of the iOS Simulator to launch the app on (e.g., 'iPhone 15', 'iPad Pro (12.9-inch)').")
    parser.add_argument("--debug", action="store_true", help="Enables debug logging for detailed output.")
    args = parser.parse_args()

    # Setting up logging
    log_level = logging.DEBUG if args.debug else logging.INFO
    logging.basicConfig(level=log_level, format='%(levelname)s: %(message)s', stream=sys.stderr)

    logging.info("--------------------------------------------------------------------------------")
    logging.info("Starting script to build and run xcode project...")
    logging.info("Arguments received and parsed")
    logging.debug(f"Arguments received :: '{args}'")

    # Check if the project file exists
    logging.debug(f"Project path :: '{args.project_path}'")
    if not os.path.exists(args.project_path):
        logging.error(f"Error: Project file not found at '{args.project_path}'", file=sys.stderr)
        sys.exit(1)

    build_and_launch(args.project_path, args.scheme, args.simulator_name)

