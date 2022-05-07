import javafx.beans.binding.When

class Triangle<out T : Number>(a: T, b: T, c: T) {

    init {
        val sides = listOf(a, b, c).map(Number::toDouble).sorted()
        require(sides[0] > 0) {"All sides must be greater than 0"}
        require(sides[0] + sides[1] > sides[2]) {"All sides must be less than the sum of other sides"}
    }

    private val countOfEqualSides = setOf(a, b, c).size

    val isEquilateral: Boolean = countOfEqualSides == 1
    val isIsosceles: Boolean = countOfEqualSides <= 2
    val isScalene: Boolean = countOfEqualSides == 3
}

