-------------------------------------------------------
GENERATE RAW:
gource -2560x1440 --output-framerate 60 --output-ppm-stream output.ppm --background FFFFFF --font-size 18 --font-colour 444444 --title "Pelan Development Process" --key --auto-skip-seconds 1 --highlight-all-users --max-file-lag 6

-------------------------------------------------------
CONVERT:
ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i output.ppm -vcodec libx264 -preset slower -pix_fmt yuv420p -crf 0.1 -threads 0 -bf 0 gource.mp4