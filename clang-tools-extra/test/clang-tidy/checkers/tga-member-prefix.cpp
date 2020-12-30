// RUN: %check_clang_tidy %s tga-member-prefix %t

class ClassA {
  private:
    int integerA;
    // CHECK-MESSAGES: :[[@LINE-1]]:9: warning: member variable 'integerA' is missing 'my' prefix
    // CHECK-FIXES: int myIntegerA;
    int myIntegerB;
};

