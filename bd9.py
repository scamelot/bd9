import subprocess
import os
import datetime
import pyperclip
import argparse

def read_date_from_file(file_path):
    with open(file_path, 'r') as file:
        date_str = file.readline().strip()
    return datetime.datetime.strptime(date_str, '%Y-%m-%d')

def write_date_to_file(file_path, date):
    with open(file_path, 'w') as file:
        file.write(date.strftime('%Y-%m-%d'))

def increment_date(date):
    return date + datetime.timedelta(days=1)

def parse_arguments():
    parser = argparse.ArgumentParser(description='bd9: Runs a backdated github commit then increments the date on each run.')
    parser.add_argument('message', help='The commit message.')
    parser.add_argument('--start', metavar='YYYY-MM-DD', help='Set the initial date.')
    return parser.parse_args()

def main():
    args = parse_arguments()

    home_dir = os.path.expanduser('~')
    backdater_path = os.path.join(home_dir, '.bd9')

    if args.start:
        start_date = datetime.datetime.strptime(args.start, '%Y-%m-%d').date()
        write_date_to_file(backdater_path, start_date)
    elif not os.path.exists(backdater_path):
        today = datetime.datetime.now().date()
        write_date_to_file(backdater_path, today)

    date = read_date_from_file(backdater_path)
    text_with_date = f'git commit -m "{args.message}" --date \"{date.strftime("%Y-%m-%d")}\"'
    cmd_args = text_with_date.split()
    subprocess.run(cmd_args, shell=True)
    next_date = increment_date(date)
    print(f'Committed for: {date.strftime("%Y-%m-%d")}. Next commit will be for: {next_date.strftime("%Y-%m-%d")}')
    write_date_to_file(backdater_path, next_date)

if __name__ == '__main__':
    main()
