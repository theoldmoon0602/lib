class BIT(T)
{
public:
    T[] data;

    this(ulong size)
    {
        this.data = new T[](size + 1);
    }

    /// sum calculates the summing of range [0, i]
    T sum(long i)
    {
        T ret = T.init;
        while (i > 0)
        {
            ret += data[i];
            i -= i & (-i); // i -= i & (-i) means drop least significant 1
        }
        return ret;
    }

    /// add data[i] += x
    void add(long i, T x)
    {
        while (i <= data.length)
        {
            data[i] += x;
            i += i & (-i); // i += i & (-i) means rise least significant 1
        }
    }
}
