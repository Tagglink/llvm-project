//===--- MemberPrefixCheck.cpp - clang-tidy -------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "MemberPrefixCheck.h"
#include "clang/AST/ASTContext.h"
#include "clang/ASTMatchers/ASTMatchFinder.h"
#include <cctype>

using namespace clang::ast_matchers;

namespace clang {
namespace tidy {
namespace tga {

void MemberPrefixCheck::registerMatchers(MatchFinder *Finder) {
  Finder->addMatcher(fieldDecl().bind("field"), this);
}

void MemberPrefixCheck::check(const MatchFinder::MatchResult &Result) {
  const auto *MatchedDecl = Result.Nodes.getNodeAs<FieldDecl>("field");
  StringRef name = MatchedDecl->getName();
  // FIXME: handle const, constexpr, static with appropriate prefixes
  if (name.size() > 2 && name.startswith("my") && std::isupper(name[2]))
    return;
  
  SourceLocation identifierLoc = MatchedDecl->getLocation();
  CharSourceRange replaceRange(
    {identifierLoc, identifierLoc.getLocWithOffset(1)},
    false);
  std::string fix = "my";
  fix += std::toupper(name[0]);

  diag(MatchedDecl->getLocation(), "member variable %0 is missing 'my' prefix")
      << MatchedDecl;
  diag(MatchedDecl->getLocation(), "insert 'my'", DiagnosticIDs::Note)
      << FixItHint::CreateReplacement(replaceRange, fix);
}

} // namespace tga
} // namespace tidy
} // namespace clang

