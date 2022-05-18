import Flattener.flatten

object Flattener {
    fun flatten(source: Collection<Any?>): List<Any> {
        return source.flatten()
    }

    private fun Collection<*>.flatten(init: MutableList<Any> = MutableList(0) {}): MutableList<Any> =
            this.fold(init) {
                accumulator, value -> when (value) {
                    is List<*> -> value.flatten(accumulator)
                    is Int -> accumulator.apply { add(value) }
                    else -> accumulator
                }
            }
}
