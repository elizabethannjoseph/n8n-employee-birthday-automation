{
  "name": "My workflow",
  "nodes": [
    {
      "parameters": {
        "conditions": {
          "options": {
            "caseSensitive": true,
            "leftValue": "",
            "typeValidation": "loose",
            "version": 3
          },
          "conditions": [
            {
              "id": "7ec69524-7949-4e29-a4a5-79a7c5d97922",
              "leftValue": "={{ $now.format('MM-dd') }}",
              "rightValue": "={{ DateTime.fromISO($json.dob).toFormat('MM-dd') }}",
              "operator": {
                "type": "string",
                "operation": "equals"
              }
            }
          ],
          "combinator": "and"
        },
        "looseTypeValidation": true,
        "options": {}
      },
      "type": "n8n-nodes-base.if",
      "typeVersion": 2.3,
      "position": [
        48,
        -32
      ],
      "id": "b1696340-a64f-430c-83af-0e65c7cc4e62",
      "name": "If"
    },
    {
      "parameters": {
        "promptType": "=define",
        "text": "=You are an HR assistant.\n\nWrite a professional birthday email for {{$json.name}}, who works in the {{$json.department}} department.\n\nRequirements:\n- Address the employee by their first name.\n- Be warm, sincere, and professional.\n- Keep the email between 60 and 100 words.\n- Congratulate them on their birthday and wish them success, happiness, good health, and continued growth.\n- Do NOT mention company events, gifts, celebrations, cakes, lunches, or parties.\n- Do NOT include placeholders or make up any information.\n- Do NOT include a subject line.\n- Return ONLY the email body.\n\nSign off exactly as:\n\nBest regards,\nHR Team",
        "options": {}
      },
      "type": "@n8n/n8n-nodes-langchain.agent",
      "typeVersion": 3.1,
      "position": [
        384,
        -112
      ],
      "id": "b0becbad-8cde-4c08-92f2-82433b0cd0c8",
      "name": "AI Agent"
    },
    {
      "parameters": {
        "model": "llama3.2:latest",
        "options": {}
      },
      "type": "@n8n/n8n-nodes-langchain.lmChatOllama",
      "typeVersion": 1,
      "position": [
        432,
        144
      ],
      "id": "fa5eb16d-eff9-4c93-ae30-45b3e4c6536d",
      "name": "Ollama Chat Model1",
      "credentials": {
        "ollamaApi": {
          "id": "KuznL52wjd7YvsLn",
          "name": "Ollama account"
        }
      }
    },
    {
      "parameters": {
        "fromEmail": "elizabethjosephint@gmail.com",
        "toEmail": "liza.joseph0202@gmail.com",
        "subject": "=Happy Birthday,{{ $('Extract from File').item.json.name }}",
        "emailFormat": "text",
        "text": "={{ $json.output }}",
        "options": {}
      },
      "type": "n8n-nodes-base.emailSend",
      "typeVersion": 2.1,
      "position": [
        768,
        -112
      ],
      "id": "ba7fb1a5-e212-4cf2-85ca-d56a0cfb7559",
      "name": "Send an Email",
      "webhookId": "0c96d13f-471a-439c-9517-68d234057b37",
      "credentials": {
        "smtp": {
          "id": "MaOzJc3e2O2qpEOW",
          "name": "SMTP account"
        }
      },
      "onError": "continueErrorOutput"
    },
    {
      "parameters": {
        "fileSelector": "/home/node/.n8n-files/employees.csv",
        "options": {}
      },
      "type": "n8n-nodes-base.readWriteFile",
      "typeVersion": 1.1,
      "position": [
        -304,
        -32
      ],
      "id": "35bd6223-fc52-4e66-bb3e-7863dda60d39",
      "name": "Read/Write Files from Disk"
    },
    {
      "parameters": {
        "options": {}
      },
      "type": "n8n-nodes-base.extractFromFile",
      "typeVersion": 1.1,
      "position": [
        -128,
        -32
      ],
      "id": "f3383407-1862-4b0c-8c71-93691d3b70be",
      "name": "Extract from File"
    },
    {
      "parameters": {},
      "type": "n8n-nodes-base.manualTrigger",
      "typeVersion": 1,
      "position": [
        -496,
        -32
      ],
      "id": "9a0bad7a-2821-4c98-93b9-00768d981d96",
      "name": "When clicking ‘Execute workflow’"
    },
    {
      "parameters": {},
      "type": "n8n-nodes-base.noOp",
      "typeVersion": 1,
      "position": [
        208,
        16
      ],
      "id": "31d09fc9-8a72-45c5-904b-1d58eba2f6a1",
      "name": "No Operation, do nothing"
    }
  ],
  "pinData": {},
  "connections": {
    "If": {
      "main": [
        [
          {
            "node": "AI Agent",
            "type": "main",
            "index": 0
          }
        ],
        [
          {
            "node": "No Operation, do nothing",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "Ollama Chat Model1": {
      "ai_languageModel": [
        [
          {
            "node": "AI Agent",
            "type": "ai_languageModel",
            "index": 0
          }
        ]
      ]
    },
    "AI Agent": {
      "main": [
        [
          {
            "node": "Send an Email",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "Read/Write Files from Disk": {
      "main": [
        [
          {
            "node": "Extract from File",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "Extract from File": {
      "main": [
        [
          {
            "node": "If",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "When clicking ‘Execute workflow’": {
      "main": [
        [
          {
            "node": "Read/Write Files from Disk",
            "type": "main",
            "index": 0
          }
        ]
      ]
    }
  },
  "active": false,
  "settings": {
    "executionOrder": "v1",
    "binaryMode": "separate",
    "availableInMCP": false
  },
  "versionId": "b28e45fc-08d1-451a-bb26-baf8fd0b17e4",
  "meta": {
    "templateCredsSetupCompleted": true,
    "instanceId": "09a789bab640e46187d5ab5b350e8e5df943f06e6bf305c5fc15413c98914545"
  },
  "nodeGroups": [],
  "id": "YYy15sf4aYDx01O9",
  "tags": []
}