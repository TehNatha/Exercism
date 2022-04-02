object Hamming {

    fun compute(leftStrand: String, rightStrand: String): Int {
        require(leftStrand.length == rightStrand.length)
            {"left and right strands must be of equal length"}
        
        val maxIndex = leftStrand.length - 1
        var hammingNumber = 0

        for (index in 0..maxIndex)
            if (leftStrand[index] != rightStrand[index])
                hammingNumber++

        return hammingNumber
    }
}
