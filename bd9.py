import sys
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
    parser = argparse.ArgumentParser(description='Backdater: Copy text with a date and increment the date.')
    parser.add_argument('string', help='The text to copy with the date.')
    parser.add_argument('--start', metavar='MM-DD-YYYY', help='The initial date (format: MM-DD-YYYY).')
    return parser.parse_args()

def main():
    args = parse_arguments()

    home_dir = os.path.expanduser('~')
    backdater_path = os.path.join(home_dir, '.backdater')

    if args.start:
        start_date = datetime.datetime.strptime(args.start, '%m-%d-%Y').date()
        write_date_to_file(backdater_path, start_date)
    elif not os.path.exists(backdater_path):
        today = datetime.datetime.now().date()
        write_date_to_file(backdater_path, today)

    date = read_date_from_file(backdater_path)
    text_with_date = f'git commit -m "{args.string}" --date "{date.strftime("%Y-%m-%d")}"'
    pyperclip.copy(text_with_date)
    print(f'Copied to clipboard: {text_with_date}')

    next_date = increment_date(date)
    write_date_to_file(backdater_path, next_date)

if __name__ == '__main__':
    main()
