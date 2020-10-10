import Cocoa
import CreateML

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/a1101373/Desktop/Study/iOS/Twittermenti-iOS13/twitter-sanders-apple3.csv"))


let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)

let sentimentClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")

let evaluationMetrics = sentimentClassifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")

let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

let metaData = MLModelMetadata(author: "Jeongtae Kim", shortDescription: "A model trained to classify sentiment on Tweet", version: "1.0")

try sentimentClassifier.write(to: URL(fileURLWithPath: "/Users/a1101373/Desktop/Study/iOS/Twittermenti-iOS13/TweetSentimentClassifier.mlmodel"))

try sentimentClassifier.prediction(from: "@Apple is a terrible company!")

try sentimentClassifier.prediction(from: "@Apple is a awesome company!")
