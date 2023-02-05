{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "516689fc",
   "metadata": {
    "papermill": {
     "duration": 0.008156,
     "end_time": "2023-02-05T06:46:18.839612",
     "exception": false,
     "start_time": "2023-02-05T06:46:18.831456",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# R snippets\n",
    "\n",
    "> instead of researching codes that I have previous used in Rstat projects, I am gathering it here for future use. Anyone is also welcome to use code from here. Suggestions are highly appreciated. "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "83e5ab25",
   "metadata": {
    "papermill": {
     "duration": 0.006613,
     "end_time": "2023-02-05T06:46:18.853343",
     "exception": false,
     "start_time": "2023-02-05T06:46:18.846730",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Markdown "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "52f810bc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T03:48:04.676680Z",
     "iopub.status.busy": "2023-02-05T03:48:04.674008Z",
     "iopub.status.idle": "2023-02-05T03:48:04.810334Z"
    },
    "papermill": {
     "duration": 0.006548,
     "end_time": "2023-02-05T06:46:18.866470",
     "exception": false,
     "start_time": "2023-02-05T06:46:18.859922",
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
   "id": "b91cc644",
   "metadata": {
    "papermill": {
     "duration": 0.006539,
     "end_time": "2023-02-05T06:46:18.879543",
     "exception": false,
     "start_time": "2023-02-05T06:46:18.873004",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Cleaning \n",
    "\n",
    "var_label(data) <- list(\n",
    "  no.of.muscles.involved = \"No. of muscles involved\", \n",
    "  duration.by.minutes = \"Duration (mins)\"\n",
    ")\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4ee791b6",
   "metadata": {
    "papermill": {
     "duration": 0.006546,
     "end_time": "2023-02-05T06:46:18.892626",
     "exception": false,
     "start_time": "2023-02-05T06:46:18.886080",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# gtsummary \n",
    "\n",
    "> ## Descriptive \n",
    "\n",
    "tbl_summary(tbl1_sum, missing = \"no\", by = \"treatment\", type = list(age ~ 'continuous'))  %>% add_n %>% bold_labels() %>% italicize_levels() %>%  add_p() %>% bold_p()%>% gtsummary::as_flex_table() \n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "15a76ff6",
   "metadata": {
    "papermill": {
     "duration": 0.006545,
     "end_time": "2023-02-05T06:46:18.905771",
     "exception": false,
     "start_time": "2023-02-05T06:46:18.899226",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# flextable\n",
    "\n",
    "\n",
    "> ## basic table \n",
    "\n",
    "\n",
    "rmdtable <- function(df){\n",
    " \n",
    "  bes <- autofit(theme_vanilla(flextable(df)))\n",
    "\n",
    "bes <- bg(bes, bg = \"blue\", part = \"header\")\n",
    "bes <- color(bes, color = \"white\", part = \"header\")\n",
    "\n",
    "return(bes) \n",
    "}\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "219b397e",
   "metadata": {
    "papermill": {
     "duration": 0.006538,
     "end_time": "2023-02-05T06:46:18.918943",
     "exception": false,
     "start_time": "2023-02-05T06:46:18.912405",
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
   "id": "63524b22",
   "metadata": {
    "papermill": {
     "duration": 0.006569,
     "end_time": "2023-02-05T06:46:18.932116",
     "exception": false,
     "start_time": "2023-02-05T06:46:18.925547",
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
   "id": "1f5512ed",
   "metadata": {
    "papermill": {
     "duration": 0.006572,
     "end_time": "2023-02-05T06:46:18.945280",
     "exception": false,
     "start_time": "2023-02-05T06:46:18.938708",
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
   "id": "05d4f926",
   "metadata": {
    "papermill": {
     "duration": 0.011593,
     "end_time": "2023-02-05T06:46:18.963455",
     "exception": false,
     "start_time": "2023-02-05T06:46:18.951862",
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
   "cell_type": "markdown",
   "id": "09a313c7",
   "metadata": {
    "papermill": {
     "duration": 0.006497,
     "end_time": "2023-02-05T06:46:18.977004",
     "exception": false,
     "start_time": "2023-02-05T06:46:18.970507",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## raincloud plot \n",
    "\n",
    "RPubs - Raincloud Plot with ggplot2\n",
    "https://rpubs.com/rana2hin/raincloud#:~:text=The%20Raincloud%20Plot%20is%20a,indicator%20that%20groups%20may%20exist)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "87602ffa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T06:46:18.992975Z",
     "iopub.status.busy": "2023-02-05T06:46:18.991548Z",
     "iopub.status.idle": "2023-02-05T06:46:21.454079Z",
     "shell.execute_reply": "2023-02-05T06:46:21.452857Z"
    },
    "papermill": {
     "duration": 2.472835,
     "end_time": "2023-02-05T06:46:21.456391",
     "exception": false,
     "start_time": "2023-02-05T06:46:18.983556",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.5 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "Loading required package: lubridate\n",
      "\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n",
      "Loading required package: PerformanceAnalytics\n",
      "\n",
      "Loading required package: xts\n",
      "\n",
      "Loading required package: zoo\n",
      "\n",
      "\n",
      "Attaching package: ‘zoo’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    as.Date, as.Date.numeric\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘xts’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:dplyr’:\n",
      "\n",
      "    first, last\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘PerformanceAnalytics’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:graphics’:\n",
      "\n",
      "    legend\n",
      "\n",
      "\n",
      "Loading required package: quantmod\n",
      "\n",
      "Loading required package: TTR\n",
      "\n",
      "Registered S3 method overwritten by 'quantmod':\n",
      "  method            from\n",
      "  as.zoo.data.frame zoo \n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nVSrpdAoAWHxsyxIRt6YczGAVpqbL4JNXvDcXPOej7bX7+4EZMmrWXH1049ffcePsfpxiB8w3\nlU577rjF6RQAsMj8en1j5IjficjHltb6Gs8vDW7+7Tdef/pRDUGf4appWbHpwk98baJgT//I\n4J9//Mazjqmv9XiDjSec/ZZfPLJjMdEvdoQ6Xn+3iJzb4A20faI0OPyXn7/l7BMbQ36XL3jY\nsWd+/nt/mr6d766uD6/4cnbqr289fZ3fXZco7riLj1//3Mp3Xrp7yL3e4+ZvnqyUurY/sdsV\nrVeEa/wte99T8HVXnTzy6EefTxdm8SzNU7HLxZ7/xhc+8dZ/Pe8N51/wkUv+56He6cdm/eln\nX7/4one98W3vvezKG7rT7HuEqmBsec711wedTgEAi8lJ3/75jd88QUTe+6Nf/ebnl4hI360f\n2vD6D987HHznhz95+aUfP3Ol9YMv/Z8T3nFb6fpDD3xh1Wlvv/Vp443v/+THP3BB8pFfXnDy\nmu90x0TkTd//5fc/d4SIXPrz3/7qR+8RkdFHrzrslDf94v6J177lQ5d++MJlib9d9s6Xn/XZ\ne6fv3SpMXHjEq4fbzvri175ZoykRSY384N5o9sR3rpi+zr7usfPNl2tKfet/npm+ZmzblXdP\nZY687BN7faR1Gz9oW+lLHpvNmvbGLH5m5uxvfvRzj/qP/9Cl727QkvfceO3/fOxT//uTrzUY\n2tabL/3yjT1v+9C/vStcuOVb37jko4UfX/cBJydYgfnivu+PdiCYX7Pe6SAAsDhETn75y/2N\nIrL69DPPbPWLyD2f/Lnmbnvyibva3bqIiHy+cWng+tu/JfJasXNv+6crrNArH+v67RqfKSKf\n/uR5rc1nXPrm29790AUdLztDTdaJyJFnnPmK+hoR+99ee1natfqPWx49tdkrItYXPveJ49Ze\n88VX3//x6KkBl4jE+66Y+tqjd/7bUdN5Rh/+oYh8aNnO7bD7vcd/b/V/60efl6/eWrruw5/6\njtLcX3nrrlK4O3fozPU+88nrt8jJLTN9luaj2GWj99w9krr46otODLpFpONTH7/lgk/dOJL6\nUIvrmhs3r3zbNeed2SEiK6+U8y/80k8H3/bmFt88pMKsFQqFbdu2jY+P27YdDoc7Oztt2966\ndevU1JRSqqGhYfny5fl8vqurKxaL6bre1NTU1taWSqW6u7vj8bjL5Wpubm5tbVWquju8bXtu\n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\nTNbGP+qLv3p0p78+fLuInP/rex7803VlfShlNuOjYvue/NNNN9100803Pbh5WCl99QmvOf+N\n5zeMP3zDd3748bfecvtzD971+RPnIiiAvSou78y8vMxrmlSYntzQD8fveHfjOU4HATAnOsaG\nu+ub4h7vo+0r+0L1TfGoblkTXv/2uoai0nSruH6gZ3a37O/YcPTONQBK+9hFNhxxZGUsUNz1\n6J0333TTTTff/MiWcaW0Vce96pKrz3/j+edtaiutQPuOf//Pqy47quO/r36nfP7ZuYsLYJpV\n15A9/czCiso83WF5XTP08zfVn+nV2EgNVCDdtk7euvnBjrWxGu9wIDwcCE9/y1UoHNf7fCCT\n2s+PV5iDLXYrj32lUtrKY1/5mavOP//8845oD+xxBaX7X7G27qqeBXdmIaDy2D5/9uTT8xuP\nEM63e3BGCpPfHPn1x5ovcDoIgDnhzWVf/vxTPfVNfeGGmMdrKeXLZVpikytHB9358px8UjOb\nX3pyywXoYIvdp790w/nnn3fksr3smTjttJ89V0WVGHCCbRi5Y07IH3+K7VocKyotHN8Y+eU7\nGs5uMPb3jxiAxWL35U5286wtMpDO5G27tcZj7u3wiH/EEvMQz0EHW+zOfuVZ+291AOaWUvnV\n67KnnWkH+EucjUQx/aWhn1659ANOBwFwSExNyc4Fivdzta2J/c01lW6kIh1ssXvZ4csCbRvO\nPvs1r33ta179ylMaPXuuIgNg7hQbI9kzX1Nc2n7gq2Lffjh2x3sazlnlWep0EAD/n737Do/r\nKhMG/p7bpvdeNDMqlix3xyWJkzi9koSQXoCQQugtSwIfCXXp7AIJbGDZ7AILAULYBHbTIJDE\nSUivxparLGmqNJre57bz/XFlRZaLZEfS1Ujn9/jxo3nnzp135kx559x7zjl214UDCEA6zFFR\nEeNnRnMAsMJicmsOfWSDRujacOCQVy0A0z4U+/Hrn3rq6T/8x/fu/9l3Kcay4YxzLrjgXRdc\ncMH6JWQsHkHMIsxx/Mmn82s3kNPp3jkBi19L/uJXHXeqnQhBEMeu22T4yorDDhqridLZW14C\ngGtC/tPcjsNttoBN96vimz/6xQvbBsvp/scf+K/bP/RulHjpq5+5YUO329O94YZPf2U2MySI\nxUvs6Kre+FF+3fGkqpspjxdferb8ltpZEARBzJajm8dO52w/9/L2cy+/QWpkn3nw5//8z998\n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\nAACV+H+UTigWQJ+QhgAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(tidyquant)\n",
    "library(ggdist)\n",
    "library(ggthemes)\n",
    "\n",
    "mpg %>% \n",
    "  filter(cyl %in% c(4, 6, 8)) %>% \n",
    "  ggplot(aes(x = factor(cyl), y = hwy, fill = factor(cyl))) +\n",
    "  \n",
    "  # add half-violin from {ggdist} package\n",
    "  stat_halfeye(\n",
    "    # adjust bandwidth\n",
    "    adjust = 0.5,\n",
    "    # move to the right\n",
    "    justification = -0.2,\n",
    "    # remove the slub interval\n",
    "    .width = 0,\n",
    "    point_colour = NA\n",
    "  ) +\n",
    "  geom_boxplot(\n",
    "    width = 0.12,\n",
    "    # removing outliers\n",
    "    outlier.color = NA,\n",
    "    alpha = 0.5\n",
    "  ) +\n",
    "  stat_dots(\n",
    "    # ploting on left side\n",
    "    side = \"left\",\n",
    "    # adjusting position\n",
    "    justification = 1.1,\n",
    "    # adjust grouping (binning) of observations\n",
    "    binwidth = 0.25\n",
    "  )"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f393a7eb",
   "metadata": {
    "papermill": {
     "duration": 0.008201,
     "end_time": "2023-02-05T06:46:21.473134",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.464933",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ### Line graph for each level of binary variable "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "34842293",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T06:46:21.520535Z",
     "iopub.status.busy": "2023-02-05T06:46:21.492587Z",
     "iopub.status.idle": "2023-02-05T06:46:21.529782Z",
     "shell.execute_reply": "2023-02-05T06:46:21.528391Z"
    },
    "papermill": {
     "duration": 0.05041,
     "end_time": "2023-02-05T06:46:21.531818",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.481408",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# ggplot(mapping = aes(x = Var1, y = Freq, group =1 )) +\n",
    "#   geom_line(data = subset(foo, Var2 == 1), aes(color = \"red\")) +\n",
    "#   geom_line(data = subset(foo, Var2 == 0), aes(color = \"blue\"))+\n",
    "#   theme_minimal()+\n",
    "#   labs(x = \"Days to reach optimum level\", y = \"GVHD frequency\")+\n",
    "#   scale_color_discrete(name = \"GVHD\", labels = c(\"No\", \"Yes\"))+\n",
    "#   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "64187dcd",
   "metadata": {
    "papermill": {
     "duration": 0.008248,
     "end_time": "2023-02-05T06:46:21.548381",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.540133",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## longitudinal data visualization "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "70c3135a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T06:46:21.567779Z",
     "iopub.status.busy": "2023-02-05T06:46:21.566299Z",
     "iopub.status.idle": "2023-02-05T06:46:21.576722Z",
     "shell.execute_reply": "2023-02-05T06:46:21.575365Z"
    },
    "papermill": {
     "duration": 0.022024,
     "end_time": "2023-02-05T06:46:21.578510",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.556486",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# https://stats.idre.ucla.edu/r/faq/how-can-i-visualize-longitudinal-data-in-ggplot2/\n",
    "# ggplot(data = subset(lda_data, day_post_BMT <= 7 & day_post_BMT >= 1 & level < 550), aes(x = day_post_BMT, y = level, group = MRN)) +\n",
    "# geom_line() + stat_smooth(aes(group = 1)) + stat_summary(aes(group = 1),\n",
    "#     geom = \"point\", fun.y = median, shape = 22, size = 2, fill = 'blue') + facet_grid(. ~ rec_gender)+\n",
    "#   geom_ribbon(aes(ymin=200, ymax=250), alpha=0.0025, fill = \"green\") \n",
    "# The blue points represent the median level at each time point. The blue line connecting the points is a smooth line connecting the median points. The green area represents the desired plasma level. \n",
    "\n",
    "#   Making better spaghetti (plots): Exploring the individuals in longitudinal data with the brolgar pac - RStudio\n",
    "# https://www.rstudio.com/resources/rstudioconf-2020/making-better-spaghetti-plots-exploring-the-individuals-in-longitudinal-data-with-the-brolgar-pac/\n",
    "\n",
    "# Visualise longitudinal data\n",
    "# https://cran.r-project.org/web/packages/lcsm/vignettes/v0-longitudinal-plots.html\n",
    "# \n",
    "\n",
    "# Browse Over Longitudinal Data Graphically and Analytically in R • brolgar\n",
    "# https://brolgar.njtierney.com/\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f65932a1",
   "metadata": {
    "papermill": {
     "duration": 0.008893,
     "end_time": "2023-02-05T06:46:21.596588",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.587695",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# ROC "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "cefc7236",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T06:46:21.617265Z",
     "iopub.status.busy": "2023-02-05T06:46:21.615983Z",
     "iopub.status.idle": "2023-02-05T06:46:21.626009Z",
     "shell.execute_reply": "2023-02-05T06:46:21.624655Z"
    },
    "papermill": {
     "duration": 0.022421,
     "end_time": "2023-02-05T06:46:21.627758",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.605337",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# library(pROC)\n",
    "# \n",
    "# rocobj <- roc(data$GVHD, as.numeric(data$D....18))\n",
    "# \n",
    "# g <- ggroc(rocobj)\n",
    "# \n",
    "# g + theme_minimal() + ggtitle(\"My ROC curve\") + \n",
    "#     geom_segment(aes(x = 1, xend = 0, y = 0, yend = 1), color=\"grey\", linetype=\"dashed\")\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "fc280fe8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T06:46:21.646828Z",
     "iopub.status.busy": "2023-02-05T06:46:21.645730Z",
     "iopub.status.idle": "2023-02-05T06:46:21.654281Z",
     "shell.execute_reply": "2023-02-05T06:46:21.653152Z"
    },
    "papermill": {
     "duration": 0.019663,
     "end_time": "2023-02-05T06:46:21.655936",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.636273",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# another option for ROC\n",
    "\n",
    "# pred <- with(data,prediction(data$Age.at.time.of.SCT.,data$dose_bin, label.ordering = c(1, 0)))\n",
    "# perf <- performance(pred,\"tpr\", \"fpr\")\n",
    "# auc <-performance(pred, measure = \"auc\")@y.values[[1]]\n",
    "# rd <- data.frame(x=perf@x.values[[1]],y=perf@y.values[[1]])\n",
    "# p <- ggplot(rd,aes(x=x,y=y)) + geom_path(size=1)\n",
    "# p <- p + geom_segment(aes(x=0,y=0,xend=1,yend=1),colour=\"black\",linetype= 2)\n",
    "# p <- p + geom_text(aes(x=1, y= 0, hjust=1, vjust=0, label=paste(sep = \"\", \"AUC = \",round(auc,3) )),colour=\"black\",size=4)\n",
    "# p <- p + scale_x_continuous(name= \"False positive rate\")\n",
    "# p <- p + scale_y_continuous(name= \"True positive rate\")\n",
    "# p\n",
    "# \n",
    "# opt.cut = function(perf, pred){\n",
    "#   cut.ind = mapply(FUN=function(x, y, p){\n",
    "#     d = (x - 0)^2 + (y-1)^2\n",
    "#     ind = which(d == min(d))\n",
    "#     c(sensitivity = y[[ind]], specificity = 1-x[[ind]],\n",
    "#       cutoff = p[[ind]])\n",
    "#   }, perf@x.values, perf@y.values, pred@cutoffs)\n",
    "# }\n",
    "# \n",
    "# print(opt.cut(perf, pred))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "8b4e0f63",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T06:46:21.676657Z",
     "iopub.status.busy": "2023-02-05T06:46:21.675344Z",
     "iopub.status.idle": "2023-02-05T06:46:21.685185Z",
     "shell.execute_reply": "2023-02-05T06:46:21.683980Z"
    },
    "papermill": {
     "duration": 0.022256,
     "end_time": "2023-02-05T06:46:21.687360",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.665104",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# here I was trying to detect multiple cut points\n",
    " \n",
    "# opt_cut <- cutpointr(data, Age.at.time.of.SCT., dose_bin, metric = sum_sens_spec, \n",
    "#                      tol_metric = 0.05)\n",
    "# \n",
    "# opt_cut$optimal_cutpoint\n",
    "# opt_cut %>% \n",
    "#   select(optimal_cutpoint, sum_sens_spec) %>% \n",
    "#   unnest\n",
    "# \n",
    "# plot(opt_cut)\n",
    "# \n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "0530c047",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T06:46:21.707138Z",
     "iopub.status.busy": "2023-02-05T06:46:21.705993Z",
     "iopub.status.idle": "2023-02-05T06:46:21.716011Z",
     "shell.execute_reply": "2023-02-05T06:46:21.714821Z"
    },
    "papermill": {
     "duration": 0.02206,
     "end_time": "2023-02-05T06:46:21.718281",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.696221",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# here I tried to figure out the optimal number of cut points. \n",
    "\n",
    "# optimal.cutpoint<-optimal.cutpoints(X = \"Age.at.time.of.SCT.\", status = \"dose_bin\", tag.healthy = 1, methods = \"CB\", data = data, pop.prev = NULL, ci.fit = TRUE, conf.level = 0.95, trace = FALSE)   # http://smart-statistics.com/handling-roc-curves/\n",
    "\n",
    "# summary(optimal.cutpoint)\n",
    "# \n",
    "# plot(optimal.cutpoint)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "96aa6b88",
   "metadata": {
    "papermill": {
     "duration": 0.008493,
     "end_time": "2023-02-05T06:46:21.735446",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.726953",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Longitudinal data "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f3fe9114",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T05:23:25.657285Z",
     "iopub.status.busy": "2023-02-05T05:23:25.655337Z",
     "iopub.status.idle": "2023-02-05T05:23:25.674146Z"
    },
    "papermill": {
     "duration": 0.009298,
     "end_time": "2023-02-05T06:46:21.753614",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.744316",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## GEE \n",
    "\n",
    " mf <- formula(level ~ Recipient.s.Gender. + voriconazole + age_bin + wt..D.2)\n",
    "\n",
    " geeInd <- geeglm(mf, id= Recipient.s.MRN., data=long_data, family=gaussian, corstr=\"ind\")\n",
    "\n",
    " geeInd_sum <- summary(geeInd)\n",
    " \n",
    " anova(geeInd)\n",
    "\n",
    "gee_df <- tidy(geeInd, conf.int = TRUE)\n",
    "\n",
    "gee_df <- gee_df[2:nrow(gee_df), c(1,2,5:7)]\n",
    "\n",
    "gee_df$term <- c(\"Gender - Male\", \"voriconazole prescribed\", \"Age (>9)\", \"Weight\")\n",
    "\n",
    "gee_df <- gee_df %>% \n",
    "  mutate(across(where(is.numeric), round, 2))\n",
    "\n",
    "rmdtbl(gee_df)\n",
    "\n",
    "pop_mean <- tidy(emmeans(geeInd, ~ voriconazole + age_bin))\n",
    "\n",
    "pop_mean <- pop_mean[, c(1,2,3)]\n",
    "\n",
    "names(pop_mean) <- c(\"voriconazole\", \"Age\",\"Average plasma level\")\n",
    "\n",
    "rmdtbl(pop_mean)\n",
    "\n",
    "plot(emmeans(geeInd, ~voriconazole + age_bin), horizontal=F, ylab=\"Estimated mean\", las = 1)  \n",
    "\n",
    "That's population average according to predictors\n",
    "\n",
    "\n",
    "\n",
    "Broken Stick Model for Irregular Longitudinal Data\n",
    "https://cran.r-project.org/web/packages/brokenstick/vignettes/brokenstick-article.html \n",
    " "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a185f450",
   "metadata": {
    "papermill": {
     "duration": 0.008696,
     "end_time": "2023-02-05T06:46:21.770902",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.762206",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Models\n",
    "\n",
    "> ## Multonomial logistic regression \n",
    "\n",
    "We chose the multinom function because it does not require the data to be reshaped (as the mlogit package does)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "f6a3dd31",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T06:46:21.790496Z",
     "iopub.status.busy": "2023-02-05T06:46:21.789365Z",
     "iopub.status.idle": "2023-02-05T06:46:21.802564Z",
     "shell.execute_reply": "2023-02-05T06:46:21.801257Z"
    },
    "papermill": {
     "duration": 0.024874,
     "end_time": "2023-02-05T06:46:21.804252",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.779378",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# multinom(op_dose ~ voriconazole + rec_gender + age_bin +srcr.D.2 + wt..D.2, data = data) %>%\n",
    "#   tbl_regression(exponentiate = T) %>%\n",
    "#   modify_header(estimate ~ \"**OR**\")\n",
    "\n",
    "# Model diagnostics\n",
    "\n",
    "#log_model <- multinom(op_dose ~ voriconazole + Recipient.s.Gender. + age_code, data = data)\n",
    "\n",
    "#log_model2 <- multinom(op_dose ~ voriconazole + Recipient.s.Gender. , data = data)\n",
    "\n",
    "#log_model3 <- multinom(op_dose ~ voriconazole  , data = data)\n",
    "\n",
    "#log_model4 <- multinom(op_dose ~ 1  , data = data)\n",
    "\n",
    "\n",
    "# kable(glance(log_model4), digits = 3)\n",
    "# \n",
    "# kable(glance(log_model3), digits = 3)\n",
    "# \n",
    "# kable(glance(log_model2), digits = 3)\n",
    "# \n",
    "# kable(glance(log_model), digits = 3)\n",
    "\n",
    "\n",
    "#  https://data.princeton.edu/wws509/r/c6s2 \n",
    "\n",
    "# I was trying to figure out how to test for the model diagnostics, but the model in this link, had predictor variables that failed to fit, so I got confused \n",
    "# remember to go back to the previous page in the data frame to get the data they are working with\n",
    "\n",
    "# x2 <- deviance(log_model2) - deviance(log_model)\n",
    "\n",
    "#pchisq(x2, 10, lower.tail=FALSE)\n",
    "\n",
    "# Deviance and AIC improve greatly with addition of each variable. \n",
    "# The sequence of addition is : null model, voriconazole, gender then age\n",
    "\n",
    "# Testing for IIA with the Hausman-McFadden Test\n",
    "\n",
    "#library(mlogit)\n",
    "\n",
    "# https://cran.r-project.org/web/packages/mlogit/vignettes/mlogit.pdf \n",
    "\n",
    "# preparing the data ( changing from wide to long)\n",
    "\n",
    "# Fish <- mlogit.data(Fishing, shape=\"wide\", varying=2:9, choice=\"mode\")\n",
    "# we don't have varying here since simply no variables depend on the op_dose \n",
    "\n",
    "#dta <- mlogit.data(data, shape = \"wide\", choice = \"op_dose\")\n",
    "\n",
    "#head(index(dta)) # this reveals a unique ID and the choice \n",
    "\n",
    "# mod.1 <-mlogit(op_dose ~ 1|  voriconazole + Recipient.s.Gender. + age_code , reflevel = \"less than or equal 1.5\",   data=dta)  \n",
    "# #summary(mod.1)\n",
    "#  \n",
    "# mod.alt1 <- mlogit(op_dose ~ 1|  voriconazole + Recipient.s.Gender. + age_code , reflevel = \"less than or equal 1.5\",   data=dta, alt.subset = c(\"less than or equal 1.5\",\"from 1.51 to 2\"))\n",
    "# \n",
    "# mod.alt2 <- mlogit(op_dose ~ 1|  voriconazole + Recipient.s.Gender. + age_code , reflevel = \"less than or equal 1.5\",   data=dta, alt.subset = c(\"less than or equal 1.5\",\"more than 2\"))\n",
    "# \n",
    "# mod.alt3 <- mlogit(op_dose ~ 1|  voriconazole + Recipient.s.Gender. + age_code , reflevel = \"less than or equal 1.5\",   data=dta, alt.subset = c(\"from 1.51 to 2\",\"more than 2\"))\n",
    "\n",
    "#hmftest(mod.1, mod.alt1)\n",
    "#hmftest(mod.1, mod.alt2)\n",
    "#hmftest(mod.1, mod.alt3)\n",
    "\n",
    "# Multinomial logit models are valid under the Independence of Irrelevant Alternatives (IIA)\n",
    "# assumption that states that characteristics of one particular choice alternative do not impact\n",
    "# the relative probabilities of choosing other alternatives. For example, if IIA is valid, how I\n",
    "# choose between watching a movie or attending a football game is independent of whoever\n",
    "# is giving a concert that day. Violation of the IIA assumption complicates the choice model.\n",
    "# Therefore, much is gained when the IIA assumption is validated.\n",
    "# \n",
    "# \n",
    "# https://stats.stackexchange.com/questions/380656/checking-iia-assumption-mlogit-in-r-iris-data      in the comments \n",
    "# \n",
    "# In the example of the HMF-test on the help page \"hmftest {mlogit}\" the variable avinc is dropped because it is not varying across alternatives. None of our variables are varying over alternatives so I fear you cannot use the test. In the Econometrica paper by Hausmann and McFadden where they formulate the test they also assume constant coefficients across alternatives (which assumes that covariates are varying across alternatives)\n",
    "\n",
    "#assumption failed. However, this may not be a big deal. Simply because none of our variables are varying over alternatives. \n",
    "\n",
    "# Is it okay just to show a graph of the log-odds in the multinomial versus the logistic regressions? The log-odds do appear to change particularly for the versicolor.\n",
    "# \n",
    "# par(mfrow=c(1,2))\n",
    "# \n",
    "# mod_redu2<-multinom(op_dose ~ voriconazole + Recipient.s.Gender. + age_code, data = data)\n",
    "# lo_1.5 <-log(mod_redu2$fitted.values[,2]/(mod_redu2$fitted.values[,1]))\n",
    "# lo_high<-log(mod_redu2$fitted.values[,3]/(mod_redu2$fitted.values[,1]))\n",
    "# \n",
    "# dataless<-data[which(data$op_dose==\"less than or equal 1.5\"|data$op_dose==\"from 1.51 to 2\"),]\n",
    "# mod<-glm(op_dose ~ voriconazole + Recipient.s.Gender. + age_code,family=binomial(link=logit),data=dataless)\n",
    "# plot(lo_1.5[-seq(91:119)],predict(mod))\n",
    "# abline(a=0,b=1)\n",
    "# \n",
    "# datahigh<-data[which(data$op_dose==\"less than or equal 1.5\"|data$op_dose==\"more than 2\"),]\n",
    "# mod<-glm(op_dose ~ voriconazole + Recipient.s.Gender. + age_code, family=binomial(link=logit),data = datahigh)\n",
    "# plot(lo_high,predict(mod))\n",
    "# abline(a=0,b=1)\n",
    "\n",
    "# I am confused \n",
    "\n",
    "\n",
    "# http://www.talkstats.com/threads/multinomial-logistic-regression-testing-assumptions.65580/\n",
    "\n",
    "# For the MLR estimates to be unbiased (well, to some extent, of course :)), two assumptions must be in place -- (a) lack of multicollinearity, and (b) independence of irrelevant alternatives (IIA) (Starkweather, J., & Moske, A. K. (2011). Multinomial logistic regression). \n",
    "\n",
    "#I don't have continuous predictors, so I think multi-colinearity is not a problem\n",
    "\n",
    "\n",
    "# Multinomial logistic regression prediction table \n",
    "# \n",
    "# This can be added to the appendix to show that the middle dose range was not recommended in any of the scenarios. \n",
    "# \n",
    "# Table shows the predicted probabilities of reaching the desired plasma level under each dose with respect to age, gender and antifungal prescribed. The probability is presented as a percentage for ease of interpretation. \n",
    "\n",
    "# data$Recipient.s.Gender. <- dplyr::recode(data$Recipient.s.Gender., \"Female\" = \"0\", \"Male\" = \"1\")\n",
    "# \n",
    "# data$Recipient.s.Gender. <- as.factor(as.numeric((data$Recipient.s.Gender.)))\n",
    "\n",
    "\n",
    "# newdat <- data.frame(\n",
    "#   Recipient.s.Gender. = as.factor(rep(levels(data$Recipient.s.Gender.),  each =  4)),\n",
    "#   voriconazole = as.factor(rep(levels(as.factor(data$voriconazole)),   4)),\n",
    "#   age_bin = as.factor(rep(levels(as.factor(data$age_bin))\n",
    "#                                   , each =  4)))\n",
    "\n",
    "# newdat <- expand.grid(rec_gender=c(\"Female\",\"Male\"), \n",
    "#             voriconazole =c(\"Voriconazole\",\"No voriconazole\"), \n",
    "#             age_bin=c(\"<= 9\",\">9\"))\n",
    "\n",
    "\n",
    "# test_4_pred <- multinom(op_dose ~ voriconazole + rec_gender + age_bin , data = data)\n",
    "# \n",
    "# pred_table <- cbind(newdat, predict(test_4_pred, newdat, type = \"probs\"))\n",
    "# \n",
    "# names(pred_table) <- c(\"Gender\", \"voriconazole\", \"Age\", \"prob_Less_equal_1.5\", \"prob1.5_to_2.5\", \"prob_greater_equal_2.5\")\n",
    "# \n",
    "# pred_table$Gender <- fct_collapse(pred_table$Gender, \n",
    "#                                   \"Female\" = \"0\", \n",
    "#                                   \"Male\" = \"1\")\n",
    "\n",
    "# pred_table$recommended_dose <- ifelse(pred_table$probability_to_reach_level_at_dose_more_than_1.5 > 0.5, \">1.5\", \"<=1.5\")\n",
    "\n",
    "# I used to have the code below when there was three categories for optimum dose \n",
    "\n",
    "# cole <- pred_table %>%\n",
    "#   dplyr::select(prob_Less_equal_1.5 : prob_greater_equal_2.5)\n",
    "# \n",
    "# pred_table$recommended_dose <- colnames(cole)[max.col(cole,ties.method=\"first\")]\n",
    "# \n",
    "# pred_table <- pred_table %>%\n",
    "#   rowwise() %>%\n",
    "#   mutate(expected_percentage_of_reaching_op_dose = max(prob_Less_equal_1.5, prob1.5_to_2.5, prob_greater_equal_2.5))\n",
    "# \n",
    "# library(scales)\n",
    "# \n",
    "# pred_table <- pred_table %>%\n",
    "#   mutate(prob_Less_equal_1.5 = percent(prob_Less_equal_1.5),\n",
    "#          prob1.5_to_2.5 = percent(prob1.5_to_2.5),\n",
    "#          prob_greater_equal_2.5 = percent(prob_greater_equal_2.5),\n",
    "#        expected_percentage_of_reaching_op_dose = percent(expected_percentage_of_reaching_op_dose))\n",
    "# \n",
    "# names(pred_table) <- c(\"Gender\",\t\"voriconazole\",\t\"Age\",\t\"<=1.5\",\t\"1.5-2.5\", \t\">=2.5\",\t\"recommended_dose\", \t\"Accuracy (%)\")\n",
    "# \n",
    "# rmdtbl(pred_table)\n",
    "\n",
    "# library(lazyeval)\n",
    "# nm1 <- names(iris)[1:4]\n",
    "# iris %>%\n",
    "#   dplyr::select(Sepal.Length : Petal.Width) %>% \n",
    "#   mutate_(mak= interp(~pmin(v1), v1= as.name(nm1)))\n",
    "# \n",
    "# \n",
    "# \n",
    "# \n",
    "# DF <- data.frame(V1=c(2,8,1),V2=c(7,3,5),V3=c(9,6,4))\n",
    "# \n",
    "# colnames(DF)[apply(DF,1,which.max)]\n",
    "# \n",
    "\n",
    "# Table predicted probabilities of reaching optimum plasma level of ciclosporin\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4c49f0b6",
   "metadata": {
    "papermill": {
     "duration": 0.008287,
     "end_time": "2023-02-05T06:46:21.821122",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.812835",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## Binary logistic regression "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "86a6693a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T06:46:21.840432Z",
     "iopub.status.busy": "2023-02-05T06:46:21.839246Z",
     "iopub.status.idle": "2023-02-05T06:46:21.847873Z",
     "shell.execute_reply": "2023-02-05T06:46:21.846682Z"
    },
    "papermill": {
     "duration": 0.020045,
     "end_time": "2023-02-05T06:46:21.849446",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.829401",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# mod_bin_log <- glm(dose_2_lvl ~ voriconazole + rec_gender + age_bin + phenytoin + wt..D.2, data, family = binomial)\n",
    "\n",
    "# tbl_regression(mod_bin_log, exponentiate = TRUE)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d7bb9d01",
   "metadata": {
    "papermill": {
     "duration": 0.008223,
     "end_time": "2023-02-05T06:46:21.865813",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.857590",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Let's see the predicted probability "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "fb88937b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T06:46:21.884948Z",
     "iopub.status.busy": "2023-02-05T06:46:21.883686Z",
     "iopub.status.idle": "2023-02-05T06:46:21.897580Z",
     "shell.execute_reply": "2023-02-05T06:46:21.896362Z"
    },
    "papermill": {
     "duration": 0.02567,
     "end_time": "2023-02-05T06:46:21.899644",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.873974",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# newdat_binary <- expand.grid(rec_gender=c(\"Female\",\"Male\"), \n",
    "#             voriconazole =c(\"Voriconazole\",\"No voriconazole\"), \n",
    "#             age_bin=c(\"<= 9\",\">9\"))\n",
    "\n",
    "# mod_bin_log_imited <- glm(dose_2_lvl ~ voriconazole + rec_gender + age_bin  , data, family = binomial)\n",
    "\n",
    "\n",
    "# pred_table_binary <- cbind(newdat_binary, predict(mod_bin_log_imited, newdat_binary, type = \"response\"))\n",
    "\n",
    "# names(pred_table_binary) <- c(\"Gender\", \"voriconazole\", \"Age\", \"prob_needs_higher_dose\")\n",
    "\n",
    "# pred_table_binary <- pred_table_binary %>% \n",
    "#   mutate(recommended_dose = ifelse(prob_needs_higher_dose > 0.5, \"higher than 1.5\", \"1.5\" ), \n",
    "#          probabity_reaching_level_at_selected_dose =\n",
    "#            ifelse(prob_needs_higher_dose > 0.5, scales::percent(prob_needs_higher_dose), scales::percent(1 - prob_needs_higher_dose))) %>% \n",
    "#   dplyr::select(-prob_needs_higher_dose)\n",
    "\n",
    "# rmdtbl(pred_table_binary)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "be032d66",
   "metadata": {
    "papermill": {
     "duration": 0.008488,
     "end_time": "2023-02-05T06:46:21.917145",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.908657",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## Ordinal logistic regression "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "df949de4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T06:46:21.936364Z",
     "iopub.status.busy": "2023-02-05T06:46:21.935237Z",
     "iopub.status.idle": "2023-02-05T06:46:21.945566Z",
     "shell.execute_reply": "2023-02-05T06:46:21.944418Z"
    },
    "papermill": {
     "duration": 0.022134,
     "end_time": "2023-02-05T06:46:21.947650",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.925516",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Multinomial and Ordinal Logistic Regression In R\n",
    "# https://www.analyticsvidhya.com/blog/2016/02/multinomial-ordinal-logistic-regression/\n",
    "\n",
    "# require(foreign)\n",
    "# require(ggplot2)\n",
    "# require(MASS)\n",
    "# require(Hmisc)\n",
    "# require(reshape2)\n",
    "# \n",
    "# m_ord_log <- polr(op_dose ~ voriconazole + rec_gender + age_bin  + wt..D.2, data = data, Hess=TRUE)\n",
    "# \n",
    "# summary(m_ord_log)\n",
    "# # Hess=TRUE to let the model output show the observed information matrix from optimization which is used to get standard errors.\n",
    "# \n",
    "# tidy_polr <- tidy(m_ord_log, exponentiate = T, p.values = T, conf.int = T, digits = 3)\n",
    "# \n",
    "# tidy_olr <- tidy_polr %>% \n",
    "#   dplyr::select(term, 'OR' = estimate, 'lower_conf' = conf.low, 'upper_conf' = conf.high, \"P_value\" = p.value) %>%\n",
    "#   mutate_if(is.numeric, round, digits = 3) %>% \n",
    "#   filter(row_number() <= n()-2)\n",
    "# \n",
    "# tidy_olr$term <- c(\"Vori vs No Vori\", \"Male vs Female\", \"Age > 9 vs Age < 9\", \"Weight\")\n",
    "# \n",
    "# rmdtbl(tidy_olr)\n",
    "# \n",
    "# augment(m_ord_log)\n",
    "# \n",
    "# data$op_dose_coded <- fct_collapse(data$op_dose, \n",
    "#                                    '1' = '<= 1.5', \n",
    "#                                    '2' = '1.5-2.5',\n",
    "#                                    '3' = '>= 2.5') %>% \n",
    "#   as.numeric()\n",
    "# \n",
    "# sf <- function(y) {\n",
    "#   c('Y>=1' = qlogis(mean(y >= 1)),\n",
    "#     'Y>=2' = qlogis(mean(y >= 2)),\n",
    "#     'Y>=3' = qlogis(mean(y >= 3)))\n",
    "# }\n",
    "# \n",
    "# (s <- with(data, summary(as.numeric(op_dose_coded) ~ voriconazole + rec_gender + age_bin, fun=sf)))\n",
    "# # I didn't add weight to the test, as it is a continuous variable. It gives infinity in the distance\n",
    "# \n",
    "# s[, 4] <- s[, 4] - s[, 3]\n",
    "# s[, 3] <- s[, 3] - s[, 3]\n",
    "# s\n",
    "# \n",
    "# plot(s, which=1:3, pch=1:3, xlab='logit', main=' ', xlim=range(s[,3:4]))\n",
    "# \n",
    "# The model seems ok for all predictors. However, a large deviation occurs for age. \n",
    "# \n",
    "# glance(m_ord_log)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ca7fede4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T05:23:25.657285Z",
     "iopub.status.busy": "2023-02-05T05:23:25.655337Z",
     "iopub.status.idle": "2023-02-05T05:23:25.674146Z"
    },
    "papermill": {
     "duration": 0.008452,
     "end_time": "2023-02-05T06:46:21.964641",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.956189",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "bf9788df",
   "metadata": {
    "papermill": {
     "duration": 0.008486,
     "end_time": "2023-02-05T06:46:21.981562",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.973076",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Survival\n",
    "\n",
    "> ## kaplan meier curve "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d20425bf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T03:59:32.210480Z",
     "iopub.status.busy": "2023-02-05T03:59:32.208959Z",
     "iopub.status.idle": "2023-02-05T03:59:32.248434Z"
    },
    "papermill": {
     "duration": 0.008308,
     "end_time": "2023-02-05T06:46:21.998259",
     "exception": false,
     "start_time": "2023-02-05T06:46:21.989951",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "\n",
    "km <- function(fu, st, gp, data){\n",
    "  \n",
    "  fit <- do.call(survfit, list(formula = Surv(fu, st) ~ gp ,data = data))\n",
    " \n",
    "plot = ggsurvplot(\n",
    "  fit, data = data,\n",
    "   data used to fit survival curves.\n",
    "  #surv_plot(OS_data, OS_data$OS_FU, OS_data$OS_status)\n",
    "  risk.table = TRUE,       # show risk table.\n",
    "  palette = \"jco\",\n",
    "  pval = TRUE,             # show p-value of log-rank test.\n",
    "  conf.int = FALSE,         # show confidence intervals for\n",
    "<!--   # point estimaes of survival curves. -->\n",
    "  xlim = c(0,80),        # present narrower X axis, but not affect\n",
    "<!--   # survival estimates. -->\n",
    "  break.time.by = 5,     # break X axis in time intervals by 500.\n",
    "  ggtheme = theme_minimal(), # customize plot and risk table with a theme.\n",
    "  risk.table.y.text.col = T, # colour risk table text annotations.\n",
    "  risk.table.y.text = FALSE # show bars instead of names in text annotations\n",
    "<!--   # in legend of risk table -->\n",
    ")\n",
    "return(plot)\n",
    "}\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "83e6959a",
   "metadata": {
    "papermill": {
     "duration": 0.008558,
     "end_time": "2023-02-05T06:46:22.015671",
     "exception": false,
     "start_time": "2023-02-05T06:46:22.007113",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## multivariate cox regression "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c5002b75",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T04:03:10.380868Z",
     "iopub.status.busy": "2023-02-05T04:03:10.379198Z",
     "iopub.status.idle": "2023-02-05T04:03:10.395603Z"
    },
    "papermill": {
     "duration": 0.008431,
     "end_time": "2023-02-05T06:46:22.032536",
     "exception": false,
     "start_time": "2023-02-05T06:46:22.024105",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "\n",
    "os_cox_mult <- coxph(Surv(os_time, os_st) ~ age_category + B.symptoms + early_advanced_stage + Result.of.Second.PET.CT, data) \n",
    "\n",
    "\n",
    "tbl_regression(os_cox_mult, exponentiate = TRUE,  pvalue_fun = function(x) style_pvalue(x, digits = 2)) %>% bold_labels() %>% italicize_levels() %>% bold_p() %>% add_n() %>% gtsummary::as_flex_table() \n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a75caf3a",
   "metadata": {
    "papermill": {
     "duration": 0.00835,
     "end_time": "2023-02-05T06:46:22.049279",
     "exception": false,
     "start_time": "2023-02-05T06:46:22.040929",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## mutlivariate cox using more than 1 time dependent covariate"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e55d6f3b",
   "metadata": {
    "papermill": {
     "duration": 0.008344,
     "end_time": "2023-02-05T06:46:22.066020",
     "exception": false,
     "start_time": "2023-02-05T06:46:22.057676",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "\n",
    "data %<>% mutate(tpet=if_else(!is.na(data$time_to_sec_pet),time_to_sec_pet ,max(os_time) +1 ))\n",
    "\n",
    "data %<>% mutate(trad=if_else(!is.na(data$rad_time) ,\n",
    "                              rad_time, max(os_time) + 1 ))\n",
    "\n",
    "\n",
    "t_pet_rad <- coxph(Surv(os_time,os_st) ~ B.symptoms + early_advanced_stage + tt(tpet) + tt(trad), data=data,\n",
    "             tt=function(x,t,...) (t>=x))\n",
    "\n",
    "var_label(data) <- list(\n",
    "  trad = \"Radiotherapy(tdc)\",\n",
    "  tpet = \"PET CT (tdc)\"\n",
    ")\n",
    "\n",
    "t_pet_rad %>% \n",
    "gtsummary::tbl_regression(exp = TRUE)  %>% bold_labels() %>% italicize_levels()  %>%\n",
    "  modify_table_body(dplyr::select, -p.value) %>% \n",
    "  gtsummary::as_flex_table() \n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d70a8819",
   "metadata": {
    "papermill": {
     "duration": 0.00834,
     "end_time": "2023-02-05T06:46:22.082794",
     "exception": false,
     "start_time": "2023-02-05T06:46:22.074454",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## Model diagnostics \n",
    "\n",
    "Firstly, I will the proportional hazard assumption using the schoenfeld test. I will use both the graphical and numerical tests. \n",
    "\n",
    "test.ph <- cox.zph(os_cox_mult)\n",
    "test.ph\n",
    "\n",
    "significant p values mean proportional hazard assumption violation \n",
    "\n",
    "It’s possible to do a graphical diagnostic using the function ggcoxzph() [in the survminer package], which produces, for each covariate, graphs of the scaled Schoenfeld residuals against the transformed time.\n",
    "\n",
    "ggcoxzph(test.ph)\n",
    "\n",
    "If we see a systematic departure from the horizontal line, then we can assume proportional hazards.  \n",
    "\n",
    "\n",
    "### testing influential points \n",
    "\n",
    "\n",
    "ggcoxdiagnostics(t_pet_rad, type = \"dfbeta\",\n",
    "                 linear.predictions = FALSE, ggtheme = theme_bw())\n",
    "\n",
    "Adding the type as dfbeta plots the estimated changes in the regression coefficients upon deleting each observation in turn. \n",
    "\n",
    "\n",
    "Let's also check the deviance residuals. Residuals should be roughly symmetrically distributed about zero with a standard deviation of 1.\n",
    "\n",
    "Positive values correspond to individuals that “died too soon” compared to expected survival times.\n",
    "Negative values correspond to individual that “lived too long”.\n",
    "Very large or small values are outliers, which are poorly predicted by the model.\n",
    "\n",
    "\n",
    "ggcoxdiagnostics(t_pet_rad, type = \"deviance\",\n",
    "                 linear.predictions = FALSE, ggtheme = theme_bw())"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3b9a2bde",
   "metadata": {
    "papermill": {
     "duration": 0.008251,
     "end_time": "2023-02-05T06:46:22.099352",
     "exception": false,
     "start_time": "2023-02-05T06:46:22.091101",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## max combo test\n",
    "\n",
    "### Max combo test \n",
    "\n",
    "[maxcombo: The Group Sequential Max-Combo Test for Comparing Survival Curves](https://cran.r-project.org/web/packages/maxcombo/maxcombo.pdf) \n",
    "\n",
    "The max-combo test is faacea generalization of the weighted log-rank test, which itself is a generalization of the logrank test. \n",
    "\n",
    "The original paper: [Group sequential monitoring based on the maximum of weighted log-rank statistics with the Fleming-Harrington class of weights in oncology clinical trials - PubMed](https://pubmed.ncbi.nlm.nih.gov/32522077/) \n",
    "\n",
    "[A recent clinical trial that mentions maxcombo](https://clinicaltrials.gov/ProvidedDocs/27/NCT04421027/SAP_001.pdf_)\n",
    "\n",
    "\n",
    "```{r}\n",
    "max_combo <- function(risk, overall = TRUE){\n",
    "  \n",
    "  if (overall == TRUE){\n",
    "  logrank.maxtest(\n",
    "      time  = data$os_time,\n",
    "      event = data$os_st,\n",
    "      group = risk,\n",
    "      rho   = c(0, 0, 1, 1),\n",
    "      gamma = c(0, 1, 0, 1)\n",
    "  )  \n",
    "  } else {\n",
    "    logrank.maxtest(\n",
    "      time  = data$efs_time,\n",
    "      event = data$efs_st,\n",
    "      group = risk,\n",
    "      rho   = c(0, 0, 1, 1),\n",
    "      gamma = c(0, 1, 0, 1)\n",
    "  )  \n",
    "    \n",
    "  }\n",
    "}\n",
    "\n",
    "```"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "583994e1",
   "metadata": {
    "papermill": {
     "duration": 0.008244,
     "end_time": "2023-02-05T06:46:22.115897",
     "exception": false,
     "start_time": "2023-02-05T06:46:22.107653",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## Weighted cox proportional hazard model"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "212ed62b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-05T06:46:22.135261Z",
     "iopub.status.busy": "2023-02-05T06:46:22.134102Z",
     "iopub.status.idle": "2023-02-05T06:46:22.145725Z",
     "shell.execute_reply": "2023-02-05T06:46:22.144499Z"
    },
    "papermill": {
     "duration": 0.02356,
     "end_time": "2023-02-05T06:46:22.147766",
     "exception": false,
     "start_time": "2023-02-05T06:46:22.124206",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# # the package coxphw will not work ... because there is something wrong about specification of the time dependent covariate. Moreover, the weights can be adjusted in normal cox\n",
    "# # \n",
    "# # zero3$GVHD\n",
    "# # zero2$GVHD  \n",
    "# data$GVHD <- as.character(data$GVHD)\n",
    "# data$GVHD[data$GVHD == \"Yes\"] <- 1\n",
    "# data$GVHD[data$GVHD == \"No\"] <- 0\n",
    "\n",
    "# # data$hundred <- as.Date(data$Date.of.Stem.Cell.Infusion.) + 100\n",
    "\n",
    "# # data$GVHD.D. <- ymd(data$Date.of.Stem.Cell.Infusion.) + data$GVHD.D.\n",
    "# #data$gvhd_tdc <- ifelse(is.na(data$GVHD.D.), data$hundred, data$GVHD.D.)\n",
    "\n",
    "# # data$gvhd_tdc <- data$hundred\n",
    "# # \n",
    "# # data$gvhd_tdc[!is.na(data$GVHD.D.)] <- data$GVHD.D.[!is.na(data$GVHD.D.)]\n",
    "# # \n",
    "# # data$gvhd_tdc <- as.Date(data$gvhd_tdc)\n",
    "\n",
    "# data$GVHD.D.[is.na(data$GVHD.D.)] <- 100\n",
    "\n",
    "# n_data <- data %>% dplyr::select(\"Recipient.s.MRN.\",\"GVHD\",\"GVHD.D.\", \"rec_gender\")\n",
    "\n",
    "# colnames(n_data) <- c(\"id\", \"status\", \"time\", \"gender\")\n",
    "\n",
    "\n",
    "# long_data <- gather(data, key = week, value = level, CSA.mean.level.1: CSA3)\n",
    "\n",
    "# colnames(long_data)[1] <- \"id\"\n",
    "\n",
    "# long_data$week <- car::recode(long_data$week, \"'CSA.mean.level.1' = 7; 'CSA.2' = 14; 'CSA3' = 21 \")\n",
    "\n",
    "# # long_data$weight <- rep(1, nrow(long_data))\n",
    "# # \n",
    "# # long_data$weight[long_data$week == 7 & long_data$GVHD.D. <= 10 | (long_data$week == 14 & long_data$GVHD.D. <= 18 & long_data$GVHD.D. > 10) | (long_data$week == 21 & long_data$GVHD.D. <= 25 & long_data$GVHD.D. > 18)] <- 700/18\n",
    "# # \n",
    "# # long_data$weight[long_data$weight == 1.000] <- 300/(357-18)\n",
    "# # \n",
    "# library(lubridate)\n",
    "\n",
    "# long_data$level[long_data$level == 0] <- NA\n",
    "# # according to the vignette, missing values will be carried forward ... This is a huge problem \n",
    "\n",
    "# temp <- n_data # baseline\n",
    "   \n",
    "# pbc2 <- tmerge(temp, temp, id=id, death = event(time, status)) #set range\n",
    "# pbc2 <- tmerge(pbc2, long_data, id=id, cyclo = tdc(week, level), options = list(na.rm=TRUE))\n",
    "\n",
    "\n",
    "# pbc2$weight <- rep(1, nrow(pbc2))\n",
    "\n",
    "# see <- filter(pbc2, pbc2$time - pbc2$tstart < 8 & pbc2$time - pbc2$tstart > 0) \n",
    "\n",
    "# # I multiplied 343 ( actual number after removal of deletions ) by 0.7 .. I got 240\n",
    "# # then I divided the 240 among the 13 observations that met the criteria \n",
    "\n",
    "# pbc2$weight[pbc2$time - pbc2$tstart < 8 & pbc2$time - pbc2$tstart > 0] <- 240/13\n",
    "\n",
    "# # here I divided the remaining 30%  (0.3*343) on the remaining observations  (343-13)\n",
    "\n",
    "# pbc2$weight[pbc2$weight == 1.00] <- 103/(343-13)\n",
    "\n",
    "# #sum(pbc2$weight)  # the sum should be 343, however it is here 380 because missing data are not yet deleted\n",
    "\n",
    "# # pbc2 <- pbc2[complete.cases(pbc2$cyclo),]\n",
    "# # \n",
    "# # sum(pbc2$weight)  # here it is after removal of cases\n",
    "\n",
    "# #pbc2 <- pbc2[pbc2$cyclo != 0, ]\n",
    "\n",
    "# fit1 <- coxph(Surv(time, status==1) ~ gender ,  temp)\n",
    "\n",
    "# fit2 <- coxph(Surv(tstart, tstop, death==1) ~ gender + cyclo, weights = weight,\n",
    "#               pbc2)\n",
    "\n",
    "# fit3 <- coxph(Surv(tstart, tstop, death==1) ~ gender + log(cyclo), weights = weight,\n",
    "#               pbc2)\n",
    "# seee <- pbc2[pbc2$cyclo == 0, ]\n",
    "# #rbind('baseline fit' = coef(fit1),\n",
    "#  #     'time dependent' = coef(fit2))\n",
    "\n",
    "# coxtbl <- tidy(fit3, exponentiate = TRUE, conf.int = T)\n",
    "\n",
    "# coxtbl <- coxtbl %>% \n",
    "#   dplyr::select(term, estimate, p.value, conf.low, conf.high)\n",
    "\n",
    "# names(coxtbl) <- c(\"Risk factor\", \"HR\",\"p_value\", \"Lower CI\", \"Higher CI\")\n",
    "# rmdtbl(coxtbl)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4dead7a5",
   "metadata": {
    "papermill": {
     "duration": 0.008175,
     "end_time": "2023-02-05T06:46:22.164680",
     "exception": false,
     "start_time": "2023-02-05T06:46:22.156505",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Model selection using AIC and BIC \n",
    "\n",
    "\n",
    "I will perform backward elimination and I will consider removing some variables while checking AIC and BIC. \n",
    "\n",
    "\n",
    "rmdtable( glance(t_pet_rad_efs) %>% \n",
    "  dplyr::select(AIC, BIC))\n",
    "\n",
    "Let's compare after removing `age_category`\n",
    "\n",
    "t_pet_rad_efs_no_age <- coxph(Surv(efs_time,efs_st) ~ B.symptoms + early_advanced_stage + tt(tpet) + tt(trad), data=data,\n",
    "             tt=function(x,t,...) (t>=x))\n",
    "\n",
    "rmdtable( glance(t_pet_rad_efs_no_age) %>% \n",
    "  dplyr::select(AIC, BIC))\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "e814a2a4",
   "metadata": {
    "papermill": {
     "duration": 0.00821,
     "end_time": "2023-02-05T06:46:22.181118",
     "exception": false,
     "start_time": "2023-02-05T06:46:22.172908",
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
   "duration": 6.177071,
   "end_time": "2023-02-05T06:46:22.307171",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-05T06:46:16.130100",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
