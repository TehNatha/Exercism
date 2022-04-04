class Squares(highLimit: Int) {
    
    private val numbers: List<Int> = 1.rangeTo(highLimit).toList()

    fun sumOfSquares() = numbers.square().sum()
    fun squareOfSum() = numbers.sum().square()
    fun difference() = squareOfSum() - sumOfSquares()

    internal fun Int.square(): Int = this * this
    internal fun List<Int>.square(): List<Int> = this.map { it.square() }
}
