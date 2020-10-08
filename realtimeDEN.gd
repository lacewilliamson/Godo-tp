extends Node2D

# Variables

var plainText = ""
var oneTimePad = ""
var cypherText = ""

var msgNotEnoughOTP = "Psst.. Your \"One Time Pad\" text has to be longer than your \"Plaintext\"!"


var letterConvert = {
"A": 0,
"B": 1,
"C": 2,
"D": 3,
"E": 4,
"F": 5,
"G": 6,
"H": 7,
"I": 8,
"J": 9,
"K": 10,
"L": 11,
"M": 12,
"N": 13,
"O": 14,
"P": 15,
"Q": 16,
"R": 17,
"S": 18,
"T": 19,
"U": 20,
"V": 21,
"W": 22,
"X": 23,
"Y": 24,
"Z": 25,
}

var numberConvert = {
0: "A",
1: "B",
2: "C",
3: "D",
4: "E",
5: "F",
6: "G",
7: "H",
8: "I",
9: "J",
10: "K",
11: "L",
12: "M",
13: "N",
14: "O",
15: "P",
16: "Q",
17: "R",
18: "S",
19: "T",
20: "U",
21: "V",
22: "W",
23: "X",
24: "Y",
25: "Z",
}

func _ready():
	get_node("Pan_Main/Pan_Content/btn_Decrypt")
	get_node("Pan_Main/Pan_Content/btn_Decrypt")
	



func _on_btn_Encrypt_pressed():
	plainText = inputHandler(get_node("Pan_Main/Pan_Content/te_Plain").text)
	get_node("Pan_Main/Pan_Content/te_Plain").text = plainText
	oneTimePad = inputHandler(get_node("Pan_Main/Pan_Content/te_OTP").text)
	get_node("Pan_Main/Pan_Content/te_OTP").text = oneTimePad
	cypherText = ""
	print(plainText)
	print(oneTimePad)
	
	# Checks to see if the otp length is greater than the pt length
	if (oneTimePad.length() < plainText.length()):
		get_node("Pan_Main/Pan_Content/te_CypherText").text = msgNotEnoughOTP
		
		
	else:	
		for n in range (0, plainText.length()):
			cypherText += numberConvert[encrypt(plainText[n],oneTimePad[n])]
			
		get_node("Pan_Main/Pan_Content/te_CypherText").text = cypherText.to_upper()
		
		print(cypherText)
	
func _on_btn_Decrypt_pressed():
	plainText = inputHandler(get_node("Pan_Main/Pan_Content/te_Plain").text)
	get_node("Pan_Main/Pan_Content/te_Plain").text = plainText
	oneTimePad = inputHandler(get_node("Pan_Main/Pan_Content/te_OTP").text)
	get_node("Pan_Main/Pan_Content/te_OTP").text = oneTimePad
	cypherText = ""
	print(plainText)
	print(oneTimePad)
	
	# Checks to see if the otp length is greater than the pt length
	if (oneTimePad.length() < plainText.length()):
		get_node("Pan_Main/Pan_Content/te_HelpfulHints").text = msgNotEnoughOTP
		
	else:	
		get_node("Pan_Main/Pan_Content/te_HelpfulHints").text = ""
		for n in range (0, plainText.length()):
			cypherText += numberConvert[decrypt(plainText[n],oneTimePad[n])]
			
		get_node("Pan_Main/Pan_Content/te_CypherText").text = cypherText.to_upper()
		
		print(cypherText)
	
	

func inputHandler(userText):
	var inputString = ""
	var outputString = ""
	inputString = userText.to_upper()
	
	for ch in inputString:
		if letterConvert.has(ch):
			outputString += ch
	return outputString
	

func encrypt(plainChar,otpChar):
	var value = null
	value = (letterConvert[plainChar] + letterConvert[otpChar])
	
	if (value > 25):
		value -= 26
		
	print(value)
	return value
	
func decrypt(plainChar,otpChar):
	var value = null
	value = (letterConvert[plainChar] - letterConvert[otpChar])
	
	if (value < 0):
		value += 26
		
	print(value)
	return value

	
	
	
