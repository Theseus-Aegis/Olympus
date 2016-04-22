import os
import shutil
import argparse

parser = argparse.ArgumentParser(description="Package mission")
parser.add_argument("version", type=str, default="1.0.0", help="Specifiy version number")
args = parser.parse_args()

name = "Olympus"
version = args.version
print(version)
ignore_files = [".git", "extras", "release", "tools", ".editorconfig", ".gitignore"]
release_dir = "release"

release_dir_copy = "{}/{}".format(release_dir, name)
os.chdir("..")

if os.path.exists(release_dir):
    shutil.rmtree(release_dir)
os.makedirs(release_dir)
os.makedirs(release_dir_copy)

print(os.listdir(os.path.abspath("")))

for item in os.listdir(os.path.abspath("")):
    if item not in ignore_files and ".zip" not in item:
        print("Copying {}".format(item))
        if os.path.isdir(item):
            shutil.copytree(item, "{}/{}".format(release_dir_copy, item))
        else:
            shutil.copy2(item, release_dir_copy)

release_package = shutil.make_archive("{}_v{}".format(release_dir_copy, version), "zip", release_dir_copy)
