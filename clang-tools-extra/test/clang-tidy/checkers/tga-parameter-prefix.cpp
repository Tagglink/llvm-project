void Method(char *str) { /* */ }
// CHECK-MESSAGES: :[[@LINE-1]]:19: warning: parameter 'str' is missing 'a', 'an' or 'some' prefix
// CHECK-FIXES: void Method(char *aStr) { /* */ }
void Method2(char *a) {}
// CHECK-MESSAGES: :[[@LINE-1]]:20: warning: parameter 'a' is missing 'a', 'an' or 'some' prefix
// CHECK-FIXES: void Method2(char *aA) {}
void Method3(char *b, void *c) {}
// CHECK-MESSAGES: :[[@LINE-1]]:20: warning: parameter 'b' is missing 'a', 'an' or 'some' prefix
// CHECK-MESSAGES: :[[@LINE-2]]:29: warning: parameter 'c' is missing 'a', 'an' or 'some' prefix
// CHECK-FIXES: void Method3(char *aB, void *aC) {}
void Method4(char *d, int /*unused*/) {}
// CHECK-MESSAGES: :[[@LINE-1]]:20: warning: parameter 'd' is missing 'a', 'an' or 'some' prefix
// CHECK-FIXES: void Method4(char *aD, int /*unused*/) {}
void operator delete[](void *e) throw() {}
// CHECK-MESSAGES: :[[@LINE-1]]:30: warning: parameter 'e' is missing 'a', 'an' or 'some' prefix
// CHECK-FIXES: void operator delete[](void *aE) throw() {}
int Method5(int f) { return 0; }
// CHECK-MESSAGES: :[[@LINE-1]]:17: warning: parameter 'f' is missing 'a', 'an' or 'some' prefix
// CHECK-FIXES: int Method5(int aF) { return 0; }
void Method6(void (*g)(void *) ) {}
// CHECK-MESSAGES: :[[@LINE-1]]:21: warning: parameter 'g' is missing 'a', 'an' or 'some' prefix
// CHECK-FIXES: void Method6(void (*aG)(void *) ) {}
template <typename T> void Method7(T g) {}
// CHECK-MESSAGES: :[[@LINE-1]]:38: warning: parameter 'g' is missing 'a', 'an' or 'some' prefix
// CHECK-FIXES: template <typename T> void Method7(T aG) {}
void SomeMethod(void *some) {}
// CHECK-MESSAGES: :[[@LINE-1]]:23: warning: parameter 'some' is missing 'a', 'an' or 'some' prefix
// CHECK-FIXES: void SomeMethod(void *aSome) {}
void AnotherMethod(char *an) {}
// CHECK-MESSAGES: :[[@LINE-1]]:26: warning: parameter 'an' is missing 'a', 'an' or 'some' prefix
// CHECK-FIXES: void AnotherMethod(char *aAn) {}
int YetAnotherMethod(int an) {}
// CHECK-MESSAGES: :[[@LINE-1]]:26: warning: parameter 'an' is missing 'a', 'an' or 'some' prefix
// CHECK-FIXES: int YetAnotherMethod(int aAn) {}

// Don't warn in macros.
#define M void MethodM(int) {}
M

void operator delete(void *aX) throw() {}
void Method8(char * /* unused */) {}
void Method9(char *anX) {}
typedef void (*TypeM)(int);
void operator delete[](void *someX) throw();
void operator delete[](void * /*x*/) throw();

