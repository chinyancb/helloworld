# 変数ごとに単回帰を実行する
# モデリングの際に変数の大まかな選択に使用する

simpleLm <- function(dataset, target='target', family='binomial') {

  # 回帰係数の統計量
  cf.name   <- NULL
  cf.est    <- NULL
  cf.stderr <- NULL
  cf.zvalue <- NULL
  cf.pr     <- NULL

  for (feature in colnames(dataset)) {

    if (feature == target) next

    #show(feature)
    tmp_df <- dataset[, c("target", feature)]

    # 単回帰モデル
    model <- glm(target ~ ., data = tmp_df, family = 'binomial')

    # 回帰係数の情報を取得
    cf.name   <- append(cf.name, dimnames(summary(model)$coefficients)[[1]][2])
    cf.est    <- append(cf.est, summary(model)$coefficients[2])
    cf.stderr <- append(cf.stderr, summary(model)$coefficients[4])
    cf.zvalue <- append(cf.zvalue, summary(model)$coefficients[6])
    cf.pr     <- append(cf.pr, summary(model)$coefficients[8])
    rm(tmp_df)
  }
  return(data.frame(cf.name, cf.est, cf.stderr, cf.zvalue, cf.pr))
}
