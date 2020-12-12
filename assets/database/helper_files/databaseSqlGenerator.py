import csv

class SqlGenerator:
    currentCountry = str()
    currentState = str()
    currentRegion = str()
    currentArea = str()
    currentGuide = str()
    currentGuideArea = str()
    currentLine = str()
    currentLineNumber = str()

    currentHeading = str()
    currentDescription = str()

    allData = {}

    def runMainLoop(self):
        with open('tas_highline_guidebook_csv.csv') as csv_file:
            csv_reader = csv.reader(csv_file)
            i = 0
            for line in csv_reader:
                i += 1
                indexOfWord = self.getIndentNumber(line)

                self.setClassVariables(line, indexOfWord)

                self.addDataToModel(list, indexOfWord)
                print(self.allData)
                print(line)

            
            print(self.allData)
            


    def getIndentNumber(self, list):
        index = 0
        while list[index] == '':
            index += 1
        return index

    def setClassVariables(self, list, index):
        if index == 0:
            self.currentCountry = list[index]
            self.currentState = str()
            self.currentRegion = str()
            self.currentArea = str()
            self.currenGuide = str()
            self.currentGuideArea = str()
            self.currentLine = str()
            self.currentLineNumber = str()
            self.currentHeading = str()
            self.currentDescription = str()
        elif index == 1:
            self.currentState = list[index]
            self.currentRegion = str()
            self.currentArea = str()
            self.currenGuide = str()
            self.currentGuideArea = str()
            self.currentLine = str()
            self.currentLineNumber = str()
            self.currentHeading = str()
            self.currentDescription = str()
        elif index == 2:
            self.currentRegion = list[index]
            self.currentArea = str()
            self.currenGuide = str()
            self.currentGuideArea = str()
            self.currentLine = str()
            self.currentLineNumber = str()
            self.currentHeading = str()
            self.currentDescription = str()
        elif index == 3:
            self.currentArea = list[index]
            self.currenGuide = str()
            self.currentGuideArea = str()
            self.currentLine = str()
            self.currentLineNumber = str()
            self.currentHeading = str()
            self.currentDescription = str()
        elif index == 4:
            self.currenGuide = list[index]
            self.currentGuideArea = str()
            self.currentLine = str()
            self.currentLineNumber = str()
            self.currentHeading = str()
            self.currentDescription = str()
        elif index == 5:
            self.currentGuideArea = list[index]
            self.currentLine = str()
            self.currentLineNumber = str()
            self.currentHeading = str()
            self.currentDescription = str()
        elif index == 6:
            self.currentLine = list[index]
            self.currentLineNumber = str()
            self.currentHeading = str()
            self.currentDescription = str()
        elif index == 7:
            self.currentLineNumber = list[index]
            self.currentHeading = str()
            self.currentDescription = str()
        elif index == 8:
            self.currentHeading = list[index]
            self.currentDescription = str()
        elif index == 9:
            self.currentDescription = list[index]
        return
    
    def addDataToModel(self, list, index):
        if index == 0:
            self.allData[self.currentCountry] = {}
        elif index == 1:
            self.allData[self.currentCountry][self.currentState] = {}
        elif index == 2:
            self.allData[self.currentCountry][self.currentState][self.currentRegion] = {}
        elif index == 3:
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea] = {}
        elif index == 4:
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea][self.currenGuide] = {}
        elif index == 5:
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea][self.currenGuide][self.currentGuideArea] = {}
        elif index == 6:
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea][self.currenGuide][self.currentGuideArea][self.currentLine] = {}
        elif index == 7:
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea][self.currenGuide][self.currentGuideArea][self.currentLine][self.currentLineNumber] = {}
        elif index == 8:
            self.addDetailHeader(list, index)
        elif index == 9:
            self.addDetail(list, index)

    def addDetailHeader(self, list, index):
        if self.currentLineNumber != str():
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea][self.currenGuide][self.currentGuideArea][self.currentLine][self.currentLineNumber][self.currentHeading] = list[index]
        elif self.currentLine != str():
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea][self.currenGuide][self.currentGuideArea][self.currentLine][self.currentHeading] = list[index]
        elif self.currentGuideArea != str():
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea][self.currenGuide][self.currentGuideArea][self.currentHeading] = list[index]
        elif self.currentGuide != str():
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea][self.currenGuide][self.currentHeading] = list[index]
        elif self.currentArea != str():
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea][self.currentHeading] = list[index]
        elif self.currentRegion != str():
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentHeading] = list[index]
        elif self.currentState != str():
            self.allData[self.currentCountry][self.currentState][self.currentHeading] = list[index]
        elif self.currentCountry != str():
            self.allData[self.currentCountry][self.currentHeading] = list[index]

    def addDetail(self, list, index):
        if self.currentLineNumber != str():
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea][self.currenGuide][self.currentGuideArea][self.currentLine][self.currentLineNumber][self.currentHeading][self.currentDescription] = list[index]
        elif self.currentLine != str():
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea][self.currenGuide][self.currentGuideArea][self.currentLine][self.currentHeading][self.currentDescription] = list[index]
        elif self.currentGuideArea != str():
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea][self.currenGuide][self.currentGuideArea][self.currentHeading][self.currentDescription] = list[index]
        elif self.currentGuide != str():
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea][self.currenGuide][self.currentHeading][self.currentDescription] = list[index]
        elif self.currentArea != str():##
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentArea][self.currentHeading][self.currentDescription] = list[index]
        elif self.currentRegion != str():
            self.allData[self.currentCountry][self.currentState][self.currentRegion][self.currentHeading][self.currentDescription] = list[index]
        elif self.currentState != str():
            self.allData[self.currentCountry][self.currentState][self.currentHeading][self.currentDescription] = list[index]
        elif self.currentCountry != str():
            self.allData[self.currentCountry][self.currentHeading][self.currentDescription] = list[index]

generator = SqlGenerator()
generator.runMainLoop()
