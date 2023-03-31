# Commit Backdater - bd9

## Usage
`bd9 --start 2023-01-01 "hello world"` will run a `git commit` with "hello world" as the message, dated for 2023-01-01.
The next use of `bd9 "your message here` will be dated for 2023-01-02. Each run will iterate the day by one.

Run `bd9 --start [new YYYY-MM-DD] "message"` again to reset the start date.
