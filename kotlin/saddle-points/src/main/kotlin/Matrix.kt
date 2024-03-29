data class MatrixCoordinate(val rowNum: Int, val colNum: Int)

class Matrix(private val matrix: List<List<Int>>) {

    init {
        require(matrix.map { row -> row.size }.toSet().size == 1) {"All columns must be the same size"}
    }

    private val rows = (1..matrix.size)
    private val cols = (1..matrix[0].size)

    private val allCoordinates = rows.flatMap {
        row -> cols.map {
            col -> MatrixCoordinate(row, col)
        }
    }

    private fun row(rowIndex: Int) = matrix[rowIndex]
    private fun col(colIndex: Int) = matrix.map { row -> row[colIndex] }

    val saddlePoints: Set<MatrixCoordinate> = allCoordinates
            .filter { coord -> coord.isMinInCol && coord.isMaxInRow }
            .toSet()

    private val MatrixCoordinate.isMaxInRow
        get() = value == row(rowIndex).maxOrNull()
    private val MatrixCoordinate.isMinInCol
        get() = value == col(colIndex).minOrNull()
    private val MatrixCoordinate.value
        get() = matrix[rowIndex][colIndex]
    private val MatrixCoordinate.rowIndex
        get() = this.rowNum - 1
    private val MatrixCoordinate.colIndex
        get() = this.colNum - 1
}
