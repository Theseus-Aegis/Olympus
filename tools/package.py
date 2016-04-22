import os
import shutil
import re

name = "Olympus"
version_file = "script_component.hpp"
ignore_files = [".git", "extras", "release", "tools", ".editorconfig", ".gitignore"]
release_dir = "release"

release_dir_copy = "{}/{}".format(release_dir, name)
os.chdir("..")

version_file_read = ""
with open(version_file, "r") as version_file:
    version_file_read = version_file.read()

major_text = re.search(r"#define MAJOR (.*\b)", version_file_read).group(1)
minor_text = re.search(r"#define MINOR (.*\b)", version_file_read).group(1)
patchlvl_text = re.search(r"#define PATCHLVL (.*\b)", version_file_read).group(1)
version = "{}.{}.{}".format(major_text, minor_text, patchlvl_text)

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
