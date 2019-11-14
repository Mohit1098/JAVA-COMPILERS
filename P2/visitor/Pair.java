package visitor;
import java.util.*;

public class Pair<F, S> {
    public F f; //first member of pair
    public S s; //second member of pair

    public Pair(F first, S second) {
        this.f = first;
        this.s = second;
    }

    public void setFirst(F first) {
        this.f= first;
    }

    public void setSecond(S second) {
        this.s = second;
    }

    public F getFirst() {
        return f;
    }

    public S getSecond() {
        return s;
    }
}