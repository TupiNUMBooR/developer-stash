#!/home/keller/k/localhost/k-dl/bin/python
# sudo pacman -S pkg-config
# pip install gallery-dl validators notify
import argparse
import os
import sys
import subprocess
import json
import validators
from notify import notification

def notify(text, text2, color, timeout=4000):
    print(f"{text} {text2}")
    notification('k-dl', message=f"<span color='{color}'>{text}</span> {text2}", app_name='k-dl', timeout=timeout)


def check(dir, id):
    print(dir)
    for root, dirs, files in os.walk(dir):
        if category in root:
            for file in files:
                if f"{id}" in file:
                    path = os.path.join(os.path.split(dir)[-1], os.path.relpath(root, dir), file)
                    notify("already exists as", f"{path}", "orange")
                    sys.exit(1)


try:
    parser = argparse.ArgumentParser(description='Download a file from a URL')
    parser.add_argument('url', type=str, help='URL to download file from')
    parser.add_argument('-d', '--dir', type=str, default='.', help='Directory to save downloaded file (default: current working directory)')
    parser.add_argument('-c', '--cookies', type=str, help='Gallery-dl cookies file')
    parser.add_argument('-t', '--target_dirs', action='append', type=str, help='Directories to check for existing file', default=[])
    args = parser.parse_args()
    gallery_dl_command="/home/keller/k/localhost/gallery-dl/bin/gallery-dl"

    # Check URL is valid
    if not validators.url(args.url):
        raise ValueError(f'URL {args.url} is not valid')

    # Check directory exists and is writable
    if not os.path.exists(args.dir):
        os.makedirs(args.dir, exist_ok=True)
    if not os.path.isdir(args.dir):
        raise ValueError(f'{args.dir} is not a directory')
    if not os.access(args.dir, os.W_OK):
        raise ValueError(f'Directory {args.dir} is not writable')

    # Use parsed arguments in your code as desired
    # print(f'Downloading {url} to directory {dir}')

    os.chdir(args.dir)

    notify("downloading info", args.url, "cyan", timeout=1000)
    command = [gallery_dl_command, "-j", "--cookies", args.cookies, args.url]
    process = subprocess.run(command, capture_output=True, text=True)
    # with open('example.txt', 'w') as file: file.write(process.stdout)
    response = json.loads(process.stdout)
    info = response[0][1]
    category = info["category"]
    id = info.get("id") or info.get("index") or info.get("tweet_id")
    
    for dir in args.target_dirs:
        check(dir, id)
    check('.', id)
    
    notify("downloading", args.url, "cyan")
    command = [gallery_dl_command, "--ugoira-conv", "--cookies", args.cookies, args.url]
    process = subprocess.run(command, capture_output=True, text=True)
    notify("downloaded", args.url, "lime")

except Exception as e:
    notify("download failed", f"{args.url}\n{e}", "red", timeout=16000)
    raise
