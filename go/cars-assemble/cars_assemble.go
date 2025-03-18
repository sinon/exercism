package cars

func CalculateWorkingCarsPerHour(productionRate int, successRate float64) float64 {
	return (float64(productionRate) * successRate) / 100
}

func CalculateWorkingCarsPerMinute(productionRate int, successRate float64) int {
	return int(CalculateWorkingCarsPerHour(productionRate, successRate) / 60)
}

func CalculateCost(carsCount int) uint {
	return uint(((carsCount / 10) * 95_000) + ((carsCount % 10) * 10_000))
}
