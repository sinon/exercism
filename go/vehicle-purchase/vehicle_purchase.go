package purchase

import "fmt"

func NeedsLicense(kind string) bool {
	return kind == "car" || kind == "truck"
}

func ChooseVehicle(option1, option2 string) string {
	car := option2
	if option1 < option2 {
		car = option1
	}
	return fmt.Sprintf("%s is clearly the better choice.", car)
}

func CalculateResellPrice(originalPrice, age float64) float64 {
	var percent = 0.5
	if age < 3 {
		percent = 0.8
	} else if age >= 3 && age < 10 {
		percent = 0.7
	}
	return (originalPrice * percent)
}
