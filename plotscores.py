# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "matplotlib",
# ]
# ///
import os
from collections import Counter
import matplotlib.pyplot as plt

data_dir = "data"
charts_dir = "charts"
platform_map = {
    "xbox": "Xbox",
    "xbox-360": "Xbox 360",
    "xbox-one": "Xbox One",
    "xbox-series-x": "Xbox Series X|S",
    "ps1": "PSOne",
    "ps2": "PlayStation 2",
    "ps3": "PlayStation 3",
    "ps4": "PlayStation 4",
    "ps5": "PlayStation 5",
    "psp": "PlayStation Portable",
    "ps-vita": "PlayStation Vita",
    "nintendo-64": "Nintendo 64",
    "gamecube": "Nintendo GameCube",
    "wii": "Nintendo Wii",
    "wii-u": "Nintendo Wii U",
    "nintendo-switch": "Nintendo Switch",
    "nintendo-switch-2": "Nintendo Switch 2",
    "nintendo-ds": "Nintendo DS",
    "3ds": "Nintendo 3DS",
    "game-boy-advance": "Nintendo GBA",
    "dreamcast": "Sega Dreamcast",
}

def load_data():
    data_map = {}
    for filename in os.listdir(data_dir):
        if filename.endswith(".txt"):
            with open(os.path.join(data_dir, filename), 'r') as file:
                scores = [int(line.strip()) for line in file if line.strip()]
                platform_name = filename.split('.')[0].strip()
                if platform_name not in data_map:
                    data_map[platform_name] = {}
                score_year = int(filename.split('.')[1].strip())
                data_map[platform_name][score_year] = Counter(scores)
    return data_map

def plot_scores(data_map):
    for platform, scores_by_year in data_map.items():
        years = sorted(scores_by_year.keys())
        score_counts = [scores_by_year[year] for year in years]

        plt.figure(figsize=(10, 6))
        plt.xlabel("Score")
        plt.ylabel("Frequency")
        platform_total = 0
        for year, counts in zip(years, score_counts):
            scores = list(counts.keys())
            frequencies = list(counts.values())
            total = sum(frequencies)
            platform_total += total
            plt.bar(scores, frequencies, alpha=0.5, label="%d (%d titles)" % (year, total))

        plt.title(f"Score Distribution for {platform_map.get(platform, platform)} ({platform_total} titles)")

        plt.legend(title="Year")
        plt.xticks(range(0, 101, 3))
        plt.grid(axis='y')
        consolidated_counts = Counter()
        for counts in score_counts:
            consolidated_counts.update(counts)

        consolidated_scores = sorted(consolidated_counts.keys())
        consolidated_frequencies = [consolidated_counts[score] for score in consolidated_scores]

        ax1 = plt.gca()
        ax2 = ax1.twinx()
        ax2.plot(consolidated_scores, consolidated_frequencies, color='brown', alpha=0.8, marker='o', label="Consolidated")
        ax2.set_ylabel("Consolidated Frequency", color='black')
        ax2.tick_params(axis='y', labelcolor='black')
        ax2.legend(loc="upper right")
        # Calculate mean, median, and mode for consolidated scores
        mean_score = sum(score * freq for score, freq in consolidated_counts.items()) / sum(consolidated_counts.values())
        median_score = sorted(consolidated_counts.elements())[len(list(consolidated_counts.elements())) // 2]
        mode_score = max(consolidated_counts, key=consolidated_counts.get)

        # Add markers for mean, median, and mode
        ax1.axvline(mean_score, color='blue', linestyle='--', label='Mean (%d)' % mean_score)
        ax1.axvline(median_score, color='green', linestyle='-.', label='Median (%d)' % median_score)
        ax1.axvline(mode_score, color='red', linestyle=':', label='Mode (%d)' % mode_score)

        ax1.legend(loc="upper left")
        plt.tight_layout()
        plt.savefig(f"{charts_dir}/{platform}_scores_distribution.png")
        plt.close()

data_map = load_data()
plot_scores(data_map)
