#!/bin/bash

# Displays information about user activity,
# login history and active sessions.

clear

echo "==============================================="
echo " Linux User Activity Report"
echo "==============================================="
echo

echo "Generated:"
date

echo

echo "Hostname:"
hostname

echo

echo "-----------------------------------------------"
echo "Current Logged-in Users"
echo "-----------------------------------------------"

who

echo

echo "-----------------------------------------------"
echo "Detailed User Sessions"
echo "-----------------------------------------------"

w

echo

echo "-----------------------------------------------"
echo "Recent Login History"
echo "-----------------------------------------------"

last -10

echo

echo "-----------------------------------------------"
echo "Last Login Information"
echo "-----------------------------------------------"

lastlog

echo

echo "-----------------------------------------------"
echo "Current User Information"
echo "-----------------------------------------------"

id

echo

echo "User Activity Report Completed."
