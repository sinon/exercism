package partyrobot

import (
	"fmt"
)

func Welcome(name string) string {
	return fmt.Sprintf("Welcome to my party, %s!", name)
}

func HappyBirthday(name string, age int) string {
	return fmt.Sprintf("Happy birthday %s! You are now %d years old!", name, age)
}

func AssignTable(name string, table int, neighbor, direction string, distance float64) string {
	table_msg := fmt.Sprintf("Welcome to my party, %s!\nYou have been assigned to table %03d.", name, table)
	dir_msg := fmt.Sprintf("Your table is %s, exactly %.1f meters from here.", direction, distance)
	seating_msg := fmt.Sprintf("You will be sitting next to %s.", neighbor)
	return fmt.Sprintf("%s %s\n%s", table_msg, dir_msg, seating_msg)
}
