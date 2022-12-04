{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "55e19b94",
   "metadata": {
    "papermill": {
     "duration": 0.002883,
     "end_time": "2022-12-04T04:33:08.588116",
     "exception": false,
     "start_time": "2022-12-04T04:33:08.585233",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# R snippets\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "52c7ea7b",
   "metadata": {
    "papermill": {
     "duration": 0.001775,
     "end_time": "2022-12-04T04:33:08.591886",
     "exception": false,
     "start_time": "2022-12-04T04:33:08.590111",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Markdown "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "dd9ff598",
   "metadata": {
    "papermill": {
     "duration": 0.001826,
     "end_time": "2022-12-04T04:33:08.595747",
     "exception": false,
     "start_time": "2022-12-04T04:33:08.593921",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "---\n",
    "title: \"insert title\"\n",
    "author: \"insert author\"\n",
    "date: \"`r format(Sys.time(), '%d/%m/%Y')`\" # automatically generate the date \n",
    "output:\n",
    "  word_document:\n",
    "    toc: yes\n",
    "---\n",
    "\n",
    "```{r setup, include=FALSE}\n",
    "knitr::opts_chunk$set(echo = FALSE, message = FALSE, comment = NA, warning = FALSE)\n",
    "# this chunk is used to silence code, warnings, comments and hash from appearing in output\n",
    "```"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "11983ca5",
   "metadata": {
    "papermill": {
     "duration": 0.001775,
     "end_time": "2022-12-04T04:33:08.599307",
     "exception": false,
     "start_time": "2022-12-04T04:33:08.597532",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Cleaning \n",
    "\n",
    "var_label(data) <- list(\n",
    "  no.of.muscles.involved = \"No. of muscles involved\", \n",
    "  duration.by.minutes = \"Duration (mins)\"\n",
    ")\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "26656f6a",
   "metadata": {
    "papermill": {
     "duration": 0.001706,
     "end_time": "2022-12-04T04:33:08.602720",
     "exception": false,
     "start_time": "2022-12-04T04:33:08.601014",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## gtsummary descriptive \n",
    "\n",
    "tbl_summary(tbl1_sum, missing = \"no\", by = \"treatment\", type = list(age ~ 'continuous'))  %>% add_n %>% bold_labels() %>% italicize_levels() %>%  add_p() %>% bold_p()%>% gtsummary::as_flex_table() \n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e59960e6",
   "metadata": {
    "papermill": {
     "duration": 0.001748,
     "end_time": "2022-12-04T04:33:08.606373",
     "exception": false,
     "start_time": "2022-12-04T04:33:08.604625",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Visuals  \n",
    "\n",
    "### sets a fixed size for all plots to follow \n",
    "\n",
    "```{r knitr::opts_chunk$set(fig.width=35, fig.height=10) }  \n",
    "```"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f223322a",
   "metadata": {
    "papermill": {
     "duration": 0.001897,
     "end_time": "2022-12-04T04:33:08.610043",
     "exception": false,
     "start_time": "2022-12-04T04:33:08.608146",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### stacked bar (two categorical columns -- get the counts)) \n",
    "\n",
    "data %>% \n",
    "  ggplot(aes(x = treatment, ..count..))+\n",
    "  geom_bar(aes(fill = sex), position = \"dodge\") +\n",
    "  ggtitle(\"Gender vs treatment\")+\n",
    "  theme(text = element_text(size=13))\n",
    "  \n",
    "  [![Screenshot-from-2022-12-03-22-23-08.png](https://i.postimg.cc/kGb2Vdks/Screenshot-from-2022-12-03-22-23-08.png)](https://postimg.cc/dZJsXgQZ)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "91539e96",
   "metadata": {
    "papermill": {
     "duration": 0.001729,
     "end_time": "2022-12-04T04:33:08.613556",
     "exception": false,
     "start_time": "2022-12-04T04:33:08.611827",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### strip plot with customized jitter \n",
    "\n",
    "library(scales)\n",
    "- Change stripchart colors by groups  \n",
    "\n",
    "data %>% \n",
    "    ggplot(aes(x=treatment, y=vas.scale, color = treatment)) +\n",
    "  geom_point(position = position_jitter(w = 0.2, h = 0))+ \n",
    "  ggtitle(\"VAS scale vs treatment\")+\n",
    "  ylab('Frequency')+ \n",
    "  scale_y_continuous(breaks = pretty_breaks())+\n",
    "  theme(text = element_text(size=13))\n",
    "\n",
    "[![Screenshot-from-2022-12-03-22-26-42.png](https://i.postimg.cc/xdTFhpZ2/Screenshot-from-2022-12-03-22-26-42.png)](https://postimg.cc/hX6r7sgy)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5a9b7dd7",
   "metadata": {
    "papermill": {
     "duration": 0.001942,
     "end_time": "2022-12-04T04:33:08.617283",
     "exception": false,
     "start_time": "2022-12-04T04:33:08.615341",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## plot systolic and diastolic pressure differences across treatments \n",
    "the data usally comes with 1 col for systolic and one for diastolic. Thus it requires tidying \n",
    "\n",
    "long = data %>%\n",
    "  dplyr::select(sys, dias, treatment) %>% \n",
    "  gather(bp, value, sys:dias) %>% \n",
    "  mutate(bp = recode(bp, `dias` = \"Diastolic\", `sys` = \"Systolic\"))\n",
    "\n",
    "long %>% \n",
    "  ggplot(aes(treatment, value, color=treatment)) +\n",
    "  geom_boxplot(fill='#eeeeee') +\n",
    "  facet_grid(~bp) +\n",
    "    theme(text = element_text(family = \"serif\", size = 11), legend.position=\"none\") +\n",
    "  ylab(\"Blood pressure (mm Hg)\") +\n",
    "  ggtitle(\"Basal Blood pressure vs. Treatment\") +\n",
    "  theme(text = element_text(size=13))\n",
    "  \n",
    "  [![Screenshot-from-2022-12-03-22-30-35.png](https://i.postimg.cc/GtrDgVMP/Screenshot-from-2022-12-03-22-30-35.png)](https://postimg.cc/gXSrnSbr)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "b1394cb1",
   "metadata": {
    "papermill": {
     "duration": 0.001774,
     "end_time": "2022-12-04T04:33:08.620764",
     "exception": false,
     "start_time": "2022-12-04T04:33:08.618990",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 3.761242,
   "end_time": "2022-12-04T04:33:08.742809",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-12-04T04:33:04.981567",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
