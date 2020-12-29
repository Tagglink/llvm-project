//===--- GoogleTidyModule.cpp - clang-tidy --------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "../ClangTidy.h"
#include "../ClangTidyModule.h"
#include "../ClangTidyModuleRegistry.h"
#include "ParameterPrefixCheck.h"

using namespace clang::ast_matchers;

namespace clang {
namespace tidy {
namespace tga {

class TgaModule : public ClangTidyModule {
 public:
  void addCheckFactories(ClangTidyCheckFactories &CheckFactories) override {

    CheckFactories.registerCheck<ParameterPrefixCheck>(
        "tga-parameter-prefix");
  }

  /*ClangTidyOptions getModuleOptions() override {
    ClangTidyOptions Options;
    auto &Opts = Options.CheckOptions;
    Opts["tga-readability-braces-around-statements.ShortStatementLines"] =
        "1";
    Opts["tga-readability-function-size.StatementThreshold"] = "800";
    Opts["tga-readability-namespace-comments.ShortNamespaceLines"] = "10";
    Opts["tga-readability-namespace-comments.SpacesBeforeComments"] = "2";
    return Options;
  }*/
};

// Register the TgaTidyModule using this statically initialized variable.
static ClangTidyModuleRegistry::Add<TgaModule> X("tga-module",
                                                 "Adds TGA lint checks.");

}  // namespace tga

// This anchor is used to force the linker to link in the generated object file
// and thus register the TgaModule.
volatile int TgaModuleAnchorSource = 0;

}  // namespace tidy
}  // namespace clang
