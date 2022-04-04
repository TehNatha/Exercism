object HandshakeCalculator {

    private val reverseFlag
        = 0x10

    private val actionFlags
        = mapOf(
            0x1 to Signal.WINK,
            0x2 to Signal.DOUBLE_BLINK,
            0x4 to Signal.CLOSE_YOUR_EYES,
            0x8 to Signal.JUMP
        )

    fun calculateHandshake(number: Int): List<Signal>
        = actionFlags
            .toSortedMap(getComparatorForFlag(number))
            .filterKeys { number hasFlag it }
            .values
            .toList()

    private fun getComparatorForFlag(number: Int): Comparator<Int>
        = if (number hasFlag reverseFlag) {
            Comparator.reverseOrder()
        } else {
            Comparator.naturalOrder()
        }

    internal infix fun Int.hasFlag(flag: Int): Boolean
        = this and flag == flag
}
