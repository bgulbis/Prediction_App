
web_lookup <- function(x, return_n) {
    require(httr)
    require(jsonlite)
    require(stringr)

    # Ocp-Apim-Subscription-Key
    api <- "39b702f50fd04d1f9730243bbbd6e0e8"
    names(api) <- "Ocp-Apim-Subscription-Key"

    url <- "https://api.projectoxford.ai/text/weblm/v1.0/generateNextWords"

    # model: body
    # words
    # order: 1-5, optional
    # maxNumOfCandidatesReturned, default = 5; optional

    n <- 5
    words <- str_to_lower(x)
    words <- word(words, (-1 * (n - 1)), -1)

    r <- POST(url,
              add_headers(api),
              query = list(model = "body",
                           order = n,
                           words = words,
                           maxNumOfCandidatesReturned = return_n))

    fromJSON(content(r, "text"))$candidates
}
