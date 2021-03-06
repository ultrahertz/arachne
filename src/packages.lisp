(in-package :cl-user)

(defpackage arachne.internal-utils
  (:use :cl)
  (:export :object-pipeline)
  (:documentation "Internal utilities for other parts of Arachne itself."))

(defpackage arachne.condition
  (:use :cl)
  (:export :<arachne-condition>)
  (:documentation "General Arachne conditions."))

(defpackage arachne.http
  (:use :cl :trivial-types)
  (:export :<request>
           :request-url
           :request-method
           :request-parameters
           :request-body
           :request-cookies
           :request-content-type
           :request-metadata
           :<form-request>
           :send
           :<response>
           :response-url
           :response-status
           :response-headers
           :response-body
           :response-cookies
           :response-metadata
           :<cookie>
           :cookie-name
           :cookie-value
           :cookie-expires
           :cookie-domain
           :cookie-path
           :cookie-secure-p
           :cookie-http-only-p)
  (:documentation "Implements requests and responses and the machinery to send
 and receive them through Drakma."))

(defpackage arachne.downloader
  (:use :cl :trivial-types)
  (:export :<middleware>
           :process-request
           :process-response
           :<drop-request>
           :<drop-response>
           :condition-middleware
           :condition-request
           :condition-response
           :<downloader>
           :download)
  (:documentation "The Downloader downloads takes requests, passes them through
request middlewares (Which can modify, or drop those requests), downloads them
into responses, sends the response through the chain of middlewares, and finally
returns the processed response."))

(defpackage arachne.item
  (:use :cl :trivial-types)
  (:export :<item>
           :copy
           :<filter>
           :start
           :stop
           :filter
           :<pipeline>
           :start-pipeline
           :stop-pipeline
           :filter)
  (:documentation "Items represent a piece of data downloaded by a
 spider. Pipelines are used to process items: They are a collection of filters,
 which can either manipulate an item or drop it from the pipeline altogether."))

(defpackage arachne.settings
  (:use :cl)
  (:export :<settings>
           :downloader
           :pipeline)
  (:documentation "Settings are used to control configuration of different parts
  of a spider, and can be reused for multiple spiders."))

(defpackage arachne.spider
  (:use :cl :trivial-types)
  (:export :<spider>
           :with-response
           :pipe
           :scrape
           :run)
  (:documentation "Spiders are the unifying concept behind Arachne: They perform
 the higher-level operations of scraping, like navigation and extracting data,
 delegating the lower-level bits like handling requests to the downloader and
 pipeline."))

(defpackage arachne.selector
  (:use :cl)
  (:export :<selector>
           :text
           :response
           :<empty-selector>
           :with-selector
           :css
           :xpath)
  (:documentation "Implements an interface for extracting data from XML through
 CSS selectors or XPath."))

(defpackage arachne.util
  (:use :cl)
  (:export :hash)
  (:documentation "The utils package contains various useful utilities for
 scraping."))
