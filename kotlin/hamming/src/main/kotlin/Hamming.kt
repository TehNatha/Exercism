object Hamming {

    fun compute(leftDna: String, rightDna: String): Int {
        require(leftDna.length == rightDna.length)
            {"left and right strands must be of equal length"}

        return leftDna.zip(rightDna).count { it.first != it.second }
    }
}
