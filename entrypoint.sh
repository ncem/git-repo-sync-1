git remote add target https://${INPUT_TARGET_USERNAME}:${INPUT_TARGET_TOKEN}@${INPUT_TARGET_URL#https://}

case "${GITHUB_EVENT_NAME}" in
    push)
        git push -f --all target
        git push -f --tags target
        ;;
    schedule)
        git push -f --all target
        git push -f --tags target
        ;;
    delete)
        git push -d target ${GITHUB_EVENT_REF}
        ;;
    *)
        echo "GITHUB_EVENT_NAME=${GITHUB_EVENT_NAME} GITHUB_EVENT_REF=${GITHUB_EVENT_REF}"
        ;;
esac
