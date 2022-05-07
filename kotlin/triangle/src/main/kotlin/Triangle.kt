import javafx.beans.binding.When

class Triangle<out T : Number>(a: T, b: T, c: T) {

    init {
        require(a is Float || a is Int|| a is Double) {"a value must be Float, Int, or Double"}
        require(b is Float || b is Int|| b is Double) {"b value must be Float, Int, or Double"}
        require(c is Float || c is Int|| c is Double) {"c value must be Float, Int, or Double"}
        require(a > 0) {"All sides must be greater than 0"}
        require(b > 0) {"All sides must be greater than 0"}
        require(c > 0) {"All sides must be greater than 0"}
        require(a+b > c) {"The sum of sides a and b must be greater than c"}
        require(b+c > a) {"The sum of sides b and c must be greater than a"}
        require(c+a > b) {"The sum of sides c and a must be greater than b"}
    }

    val isEquilateral: Boolean = a == b && b == c
    val isIsosceles: Boolean = a == b || b == c || c == a
    val isScalene: Boolean = a != b && b != c && c != a

    // TODO: There has to be better way to handle overloads for children of Number
    operator fun <T> T.compareTo(value: T): Int =
        when (this) {
            is Float -> when (value) {
                is Float -> this.compareTo(value)
                is Int -> this.compareTo(value)
                is Double -> this.compareTo(value)
                else -> throw IllegalArgumentException("Value must be a Float or Int")
            }
            is Int -> when (value) {
                is Float -> this.compareTo(value)
                is Int -> this.compareTo(value)
                is Double -> this.compareTo(value)
                else -> throw IllegalArgumentException("Value must be a Float or Int")
            }
            is Double -> when (value) {
                is Float -> this.compareTo(value)
                is Int -> this.compareTo(value)
                is Double -> this.compareTo(value)
                else -> throw IllegalArgumentException("Value must be a Float or Int")
            }
            else -> throw IllegalArgumentException("Value must be a Float or Int")
        }

    private operator fun <T> T.plus(value: T): Any =
            when (this) {
                is Float -> when (value) {
                    is Float -> this + value
                    is Int -> this + value
                    is Double -> this + value
                    else -> throw IllegalArgumentException("Value must be Float, Int, or Double")
                }
                is Int -> when (value) {
                    is Float -> this + value
                    is Int -> this + value
                    is Double -> this + value
                    else -> throw IllegalArgumentException("Value must be Float, Int, or Double")
                }
                is Double -> when (value) {
                    is Float -> this + value
                    is Int -> this + value
                    is Double -> this + value
                    else -> throw IllegalArgumentException("Value must be Float, Int, or Double")
                }
                else -> throw IllegalArgumentException("Value must be Float, Int, or Double")
            }
}

