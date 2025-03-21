package lasagna

func PreparationTime(layers []string, num int) int {
	if num == 0 {
		num = 2
	}
	return len(layers) * num
}

func Quantities(layers []string) (int, float64) {
	totalNoodles, totalSauce := 0, 0.0
	for _, v := range layers {
		if v == "noodles" {
			totalNoodles += 50
		} else if v == "sauce" {
			totalSauce += 0.2
		}

	}
	return totalNoodles, totalSauce
}

func AddSecretIngredient(friendsList []string, myList []string) []string {
	myList[len(myList)-1] = friendsList[len(friendsList)-1]
	return myList
}

func ScaleRecipe(quantities []float64, portions int) []float64 {
	scale := float64(portions) / 2.0
	scaledQuanities := []float64{}
	for _, v := range quantities {
		scaledQuanities = append(scaledQuanities, v*scale)
	}
	return scaledQuanities
}
