using System;

public static class ReverseString
{
    public static string Reverse(string input)
    {
        if (string.IsNullOrEmpty(input)) return input;
        var work = input.ToCharArray();
        Array.Reverse(work);
        return new string(work);

    }
}