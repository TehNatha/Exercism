class Matrix(private val matrixAsString: String) {

    private val rowDelimiter = "\n".toRegex()
    private val colDelimiter = "\\s+".toRegex()

    private val matrix: List<List<Int>> by lazy { matrixAsString.toMatrix() }

    internal fun String.toMatrix(): List<List<Int>> =
        matrixAsString
            .split(rowDelimiter)
            .map {
                    it
                        .trim()
                        .split(colDelimiter)
                        .map { it.toInt() }
                }

    fun column(colNr: Int): List<Int> = matrix.map {it[colNr - 1]}

    fun row(rowNr: Int): List<Int> = matrix[rowNr - 1]
}