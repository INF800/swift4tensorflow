import DataStructures

var st = Stack(elements: [7, "a"])

print(st.count)

st.show()

st.push("hi")
st.show()

// Removes optional as well!!
// `guard` does nothing for this

var poppedElement = st.pop() ?? "stack empty"
print(poppedElement)
st.show()

var topElement = st.Top ?? "Stack Empty"
print(topElement)
