//===--- ParameterPrefixCheck.cpp - clang-tidy ----------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "ParameterPrefixCheck.h"
#include "clang/AST/ASTContext.h"
#include "clang/ASTMatchers/ASTMatchFinder.h"
#include <cctype>
#include <string>

using namespace clang::ast_matchers;

namespace clang {
namespace tidy {
namespace tga {

void ParameterPrefixCheck::registerMatchers(MatchFinder *Finder) {
  Finder->addMatcher(parmVarDecl().bind("parameter"), this);
}

void ParameterPrefixCheck::check(const MatchFinder::MatchResult &Result) {
  const auto *MatchedDecl = Result.Nodes.getNodeAs<ParmVarDecl>("parameter");
  if (!MatchedDecl->getIdentifier())
    return;

  StringRef name = MatchedDecl->getName();
  unsigned int len = name.size();
  if (name.startswith("some") && len > 4 && std::isupper(name[4])) {
    return;
  }
  else if (name.startswith("an") && len > 2 && std::isupper(name[2])) {
    return;
  } 
  else if (name.startswith("a") && len > 1 && std::isupper(name[1])) {
    return;
  }

  SourceLocation identifierLoc = MatchedDecl->getLocation();
  CharSourceRange replaceRange(
    {identifierLoc, identifierLoc.getLocWithOffset(1)},
    false);
  std::string fix = "a";
  fix += std::toupper(name[0]);
  diag(identifierLoc, "parameter %0 is missing 'a', 'an' or 'some' prefix") 
      << MatchedDecl;
  diag(identifierLoc, "insert 'a', 'an', or 'some'", DiagnosticIDs::Note)
      << FixItHint::CreateReplacement(replaceRange, fix);
}

} // namespace tga
} // namespace tidy
} // namespace clang
