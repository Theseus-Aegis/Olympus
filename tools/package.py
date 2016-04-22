import os
import shutil

name = "Olympus"
version = "1.0.0"
ignore_files = [".git", "extras", "release", "tools", ".editorconfig", ".gitignore"]
release_dir = "release"
release_dir_copy = "{}/{}_v{}".format(release_dir, name, version)

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
            shutil.copytree(item, release_dir_copy)
        else:
            shutil.copy2(item, release_dir_copy)

release_package = shutil.make_archive(release_dir_copy, "zip", release_dir_copy)
