package booking

import (
	"fmt"
	"time"
)

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
	layout := "1/2/2006 15:04:05"
	t, _ := time.Parse(layout, date)
	return t
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
	layout := "January 2, 2006 15:04:05"
	appt, _ := time.Parse(layout, date)
	return appt.Before(time.Now())
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
func IsAfternoonAppointment(date string) bool {
	layout := "Monday, January 2, 2006 15:04:05"
	appt, _ := time.Parse(layout, date)
	return appt.Hour() >= 12 && appt.Hour() < 18
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
	appt := Schedule(date)
	date_str := appt.Format("Monday, January 2, 2006, at 15:04")
	return fmt.Sprintf("You have an appointment on %s.", date_str)
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
	return time.Date(time.Now().Year(), 9, 15, 0, 0, 0, 0, time.FixedZone("UTC", 0))
}
