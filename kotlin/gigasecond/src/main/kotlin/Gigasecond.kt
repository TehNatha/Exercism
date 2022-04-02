import java.time.LocalDateTime
import java.time.LocalDate
import kotlin.math.pow

class Gigasecond(val givenDate: LocalDateTime) {

    private val gigaSecond : Long = 10.0.pow(9.0).toLong()

    constructor(givenDate: LocalDate) : this(givenDate.atStartOfDay())

    val date: LocalDateTime = givenDate.plusSeconds(gigaSecond);
}
