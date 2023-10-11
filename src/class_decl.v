module objc

// A type used to declare a new class.
[noinit]
pub struct ClassDecl {
	cls voidptr [required] // the Objective-C Class object
}

// ClassDecl.new creates a new class. It returns `none` if the class could not be created (for example,
// the desired name is already in use).
pub fn ClassDecl.new(superclass Class, name string, extra_bytes usize) ?ClassDecl {
	unsafe {
		cls := C.objc_allocateClassPair(superclass.ptr, &char(name.str), extra_bytes)
		if cls != nil {
			return ClassDecl{cls}
		}
		return none
	}
}
