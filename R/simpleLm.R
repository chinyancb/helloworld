# 変数ごとに単回帰を実行する
# モデリングの際に変数の大まかな選択に使用する
#' modeling simple linear regression
#' @param dataset object name of dataset for simple linear regression.
#' @param target objective variable on dataset for simple linear regression.
#' @param family a description of the error distribution and link function to be used in the model. default "binomial"
#' @importFrom dplyr select arrange mutate case_when %>%
#' @export
simpleLm <- function(dataset, target='target', family='binomial') {

  # 回帰係数の統計量
  cf.name   <- NULL
  cf.est    <- NULL
  cf.stderr <- NULL
  cf.zvalue <- NULL
  cf.pr     <- NULL
  cf.deviance <- NULL

  # 目的変数の有無確認
  if (!sum(colnames(dataset) == target)) {
    cat(sprintf("not found target variable. [%s]\n", target))
    return(FALSE)
  }

  # 目的変数のindex
  tgt_index <- which(colnames(dataset) == target)

  for (n_index in 1:length(colnames(dataset))) {

    if (n_index == tgt_index) next

    # 単回帰モデル
    tmp_df <- dataset %>% dplyr::select(tgt_index, n_index)
    model <- glm(tmp_df[, 1] ~ tmp_df[, 2], data = tmp_df, family = 'binomial')

    # 回帰係数の情報を取得
    cf.name   <- append(cf.name, colnames(dataset)[n_index])
    cf.est    <- append(cf.est, summary(model)$coefficients[2])
    cf.stderr <- append(cf.stderr, summary(model)$coefficients[4])
    cf.zvalue <- append(cf.zvalue, summary(model)$coefficients[6])
    cf.pr     <- append(cf.pr, summary(model)$coefficients[8])
    cf.deviance <- append(cf.deviance, summary(model)$deviance)
    rm(tmp_df)
  }

  # 結果を整える
  ret <- data.frame(cf.name, cf.est, cf.stderr, cf.zvalue, cf.deviance, cf.pr) %>%
    dplyr::arrange(cf.deviance, cf.pr) %>%
    dplyr::mutate(signif = dplyr::case_when(
      is.na(cf.pr)    ~ 'NA',
      cf.pr <= 0.001  ~ '***',
      cf.pr <= 0.01   ~ '**',
      cf.pr <= 0.05   ~ '*',
      cf.pr <= 0.1    ~ '.',
      cf.pr <= 1      ~ ' '
    ))
  return(ret)
}
