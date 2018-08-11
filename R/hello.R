# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

hello <- function() {
  print("Hello, world!")
}

## 変数ごとに単回帰を実行
#cf.name   <- NULL
#cf.est    <- NULL
#cf.stderr <- NULL
#cf.zvalue <- NULL
#cf.pr     <- NULL
#for (feature in colnames(iris_logit_df)) {
#
#  if (feature == 'target') next
#
#  show(feature)
#  tmp_df <- iris_logit_df[, c("target", feature)]
#  model <- glm(target ~ ., data = tmp_df, family = 'binomial')
#
#  # 回帰係数の情報を取得
#  cf.name   <- append(cf.name, dimnames(summary(model)$coefficients)[[1]][2])
#  cf.est    <- append(cf.est, summary(model)$coefficients[2][1])
#  cf.stderr <- append(cf.stderr, summary(model)$coefficients[2][2])
#  cf.zvalue <- append(cf.zvalue, summary(model)$coefficients[2][3])
#  cf.pr     <- append(cf.pr, summary(model)$coefficients[2][4])
#  #show(summary(model))
#  rm(tmp_df)
#}
