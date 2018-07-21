library(yaml)



x <- yaml.load_file("config.yml")

print(x)

w <- data.frame(matrix(0, ncol = 6, nrow = 2))

names <- c("date","name","partner","type","startTime","duration")

colnames(w) <- names

ym <- as.yaml(w)

write_yaml(ym, "writeyaml.yml", fileEncoding = "UTF-8")

print(ym)
