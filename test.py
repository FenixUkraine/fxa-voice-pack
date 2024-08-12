from ukrainian_tts.tts import TTS, Voices, Stress
import csv
import os

file_name = 'ua01.csv'
f_name, f_extensiob = os.path.splitext(os.path.basename(file_name))
print("Generate pack for: ", f_name)


tts = TTS(device="cpu") # can try gpu, mps

# Voices
# 'Dmytro', 'Lada', 'Mykyta', 'Oleksa', 'Tetiana'
voice = Voices.Oleksa.value

# Stress
# 'Dictionary', 'Model'
stress = Stress.Dictionary.value

os.makedirs('test', exist_ok=True)
text = "Бул+а спроба підбору коду."
with open(os.path.join("test", 'test-dictionary.wav'), mode="wb") as wav_file:
    _, output_text = tts.tts(text, voice, stress, wav_file)

stress = Stress.Model.value

with open(os.path.join("test", 'test-model.wav'), mode="wb") as wav_file:
    _, output_text = tts.tts(text, voice, stress, wav_file)

exit()

for v in Voices:
    voice = v.value

    os.makedirs(f_name + '/' + voice, exist_ok=True)
    # voice

    # Відкриття та читання CSV-файлу
    with open(file_name, mode='r') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=';')
        for row in csv_reader:
            if(len(row) != 0):
                wav_name = row[0]
                text = row[1]
                print("Processing: ", wav_name)
                with open(os.path.join(f_name, voice, wav_name+'.wav'), mode="wb") as wav_file:
                    _, output_text = tts.tts(text, voice, Stress.Dictionary.value, wav_file)
                
