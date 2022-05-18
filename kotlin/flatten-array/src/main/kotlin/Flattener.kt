import Flattener.flatten

object Flattener {
    fun flatten(source: Collection<Any?>): List<Any> {
        return source.flatten()
    }

    private fun Collection<*>.flatten(init: MutableList<Any> = MutableList(0) {}): MutableList<Any> =
            filterNotNull()
                .fold(init) {
                    accumulator, value -> when (value) {
                        is List<*> -> value.flatten(accumulator)
                        else -> accumulator.apply { add(value) }
                    }
                }
}
