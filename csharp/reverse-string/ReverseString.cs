using System;
using System.Linq;

public static class ReverseString
{
    public static string Reverse(string input)
    {
        //throw new NotImplementedException("You need to implement this function.");
        if (string.IsNullOrEmpty(input)) return input;
        return input.Reverse().Aggregate("", (result, element) => result + element );
    }
}