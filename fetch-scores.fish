set PLATFORM $argv[1]
set YEAR $argv[2]
set URL "https://www.metacritic.com/browse/game/$PLATFORM/all/$YEAR/new/?platform=$PLATFORM&page="
set Q_SCORE ".c-finderProductCard_metascoreValue span"
set Q_EMPTY ".c-finderEmpty"

set PAGE 1
set SCORES
while true
    set JITTER (math (random) '%' 250000)
    sleep (math $JITTER / 1000000)
    set DATA (curl --silent "$URL"$PAGE)
    echo "Fetching page $PAGE..."
    if echo $DATA | htmlq $Q_EMPTY | rg -q 'c-finderEmpty'
        echo "No more pages found."
        break
    end
    set -a SCORES (echo $DATA | htmlq $Q_SCORE --text)
    set PAGE (math $PAGE + 1)
end

if test -z "$SCORES"
    echo "No scores found for $PLATFORM in $YEAR."
    exit
end

set OUTPUT_FILE "data/$PLATFORM.$YEAR.txt"
echo $SCORES | tr ' ' '\n' > $OUTPUT_FILE
echo "Scores have been dumped into $OUTPUT_FILE."
