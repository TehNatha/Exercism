using System;

public static class Leap
{
    //on every year that is evenly divisible by 4
    //  except every year that is evenly divisible by 100
    //    unless the year is also evenly divisible by 400
    public static bool IsLeapYear(int year)
    {
        if (year % 4 != 0)
            return false;
        else if (year % 100 == 0 && year % 400 != 0)
            return false;
        else 
            return true;
    }
}